# The RapidLinux initramfs

Engineering reference for the four files in this directory. They are the entire early boot
of every RapidLinux ISO: from the moment the kernel hands control to `/init` until the real
Slackware `/sbin/init` takes over, and again at shutdown when everything has to come back
apart cleanly.

There is exactly **one** copy of these files. `RapidBuild64` is the source; the other eleven
projects symlink `baseoutput/RLBFILES/irfs` and `baseoutput/04-prep_irfs.sh` into it
(see `copy_proj.sh`). Editing anything here changes all twelve ISOs.

| File | Role |
|---|---|
| `init` | The whole boot sequence, top to bottom. Deliberately short and readable. |
| `livekit.irfs.lib` | Every function `init` calls. The load-bearing file. |
| `rltar_pxedl.irfs.lib` | RapidLinux-specific network boot (`rltar=`). |
| `cleanup` | Runs at shutdown as PID 1 and unmounts everything. |

Upstream heritage is Tomas M's Linux Live Kit; RapidLinux diverged from Slax long ago and
the two are no longer interchangeable.

---

## 1. What ships, and how it is built

`04-prep_irfs.sh` assembles a staging tree at `${BDIR}/irfs` in twelve lines of real work:

```sh
xzm2dir ${BBMOD} ${IRFSDIR}                     # busybox 1.29.3, from ${PACKAGESDIR}/busybox/
xzm2dir 000-kmods-${KERNVERS}.xzm ${IRFSDIR}    # the ENTIRE kernel module tree
rm -rf ${IRFSDIR}/usr                           # keep only /sbin/busybox
ln -s busybox ${IRFSDIR}/sbin/sh
ln -s sbin ${IRFSDIR}/bin
install -D -m 0755 RLBFILES/irfs/init                 ${IRFSDIR}/init
install -D -m 0755 RLBFILES/irfs/cleanup              ${IRFSDIR}/cleanup
install -D -m 0644 RLBFILES/irfs/livekit.irfs.lib     ${IRFSDIR}/lib/livekit.irfs.lib
install -D -m 0644 RLBFILES/irfs/rltar_pxedl.irfs.lib ${IRFSDIR}/lib/rltar_pxedl.irfs.lib
```

Only those four files are installed. Anything else in this directory — this document, for
instance — is never shipped.

Then `07-stamp_iso.sh` turns the staging tree into the image:

```sh
install -D -m 0644 ${KERNELPKGDIR}/bzImage ${BOOTDIR}/vmlinuz
( cd ${IRFSDIR} && find . | cpio -H newc -o | lzma > ${BOOTDIR}/irfs.img )
```

`newc` cpio piped through **lzma**, not gzip and not xz, so the kernel needs
`CONFIG_RD_LZMA=y`. `make_iso.sh` then calls `mkisofs` (not xorriso) with an isolinux El
Torito record plus an EFI alt-boot record pointing at either `boot/grub/efi.img` or
`EFI/BOOT/bootx64.efi` depending on `RLUEFIBOOT`.

Two consequences worth knowing:

- **Every kernel module is in the initramfs.** There is no selective copy and no `depmod` at
  build time; `modules.dep` comes from whatever built the kmods pack. That is why
  `modprobe squashfs` and friends just work. It is also why a new filesystem driver needs no
  build-script change at all.
- **Some projects prune the pack first.** `VPS64` and `IntelLaptop64` run
  `01z-clean_kmods.sh`, which explodes `000-kmods-*.xzm`, deletes large driver trees and
  repacks it. It never touches `kernel/fs/`, so filesystem drivers survive pruning.

Fast rebuild loop, on a box with `/opt/RL/packages` present:

```sh
export RAPIDBUILDSDIR=/path/to/RapidBuilds
cd RapidBuild64 && ./rebuild.sh bo      # baseoutput only: initramfs + ISO
```

---

## 2. Boot flow, end to end

```
  kernel unpacks irfs.img
        |
  /init  ------------------------------------------------------------------
        |
        |  busybox --install -s /sbin        create every applet symlink
        |  rm /sbin/init                     busybox links init to itself; cleanup needs
        |                                    that name later, so take it back now
        |  source /lib/*.irfs.lib            livekit first, then rltar_pxedl
        |
   transfer_initramfs                        escape the initramfs (see below)
   init_proc_sysfs                           /proc, /sys, remount / rw, /etc/mtab symlink
   init_devs                                 mdev -s; modprobe zram loop squashfs fuse
   init_overlay                              modprobe overlay + verify /proc/filesystems
        |
   find_data 15 /memory/data                 locate the rl/ directory (15s of retries)
   persistent_changes  $DATA /memory/changes setup the writable layer, if perch
   copy_to_ram         $DATA /memory/changes if toram, copy and release the medium
        |
   mount_bundles $DATA /memory/bundles base      >  /memory/lowerdirs
   mount_bundles $DATA /memory/bundles modules   >> /memory/lowerdirs
   init_union /memory/changes /memory/union /memory/lowerdirs
        |
   copy_rootcopy_content                     cp -a $DATA/rootcopy/* into the union
   fstab_create                              write a minimal /etc/fstab
        |
   change_root /memory/union ------------------------------------------------
        |  mkdir boot dev proc sys tmp mnt run; mknod console/tty/null
        |  ln -s /bin/true sbin/fsck.overlay
        |  mount -n -o remount,ro overlay .
        |  pivot_root . mnt/live             the initramfs becomes /mnt/live
        |  exec chroot . /sbin/init          Slackware takes over
```

### Why `transfer_initramfs` exists

`pivot_root(2)` refuses to operate on the initramfs rootfs. So before doing anything else,
`init` mounts a tmpfs at `/m`, copies the whole tree into it, and `switch_root`s into it,
re-executing itself:

```sh
mount -t tmpfs -o size="100%" tmpfs $SWITCH
cp -a /??* $SWITCH 2>/dev/null   # two-and-more-letter dirs only, hence the /m name
exec switch_root -c /dev/console . $0
```

`/lib/initramfs_escaped` is the marker that stops it happening twice. The comment in the
source says "ramfs" but the code mounts **tmpfs**, which matters: the overlay's `upperdir`
ends up on it, and that requires `CONFIG_TMPFS_XATTR=y`.

### The hidden debug shells

`init` has `debug_shell` calls at roughly column 150 on seven lines, pushed off the right of
a normal terminal on purpose. They are no-ops unless `debug` is on the kernel command line.
`cat -A init` or a wide terminal reveals them. They fire after `debug_start`, after
`find_data`, after `persistent_changes`, after `copy_to_ram`, after `mount_bundles`, after
`init_union` and after `fstab_create` — which is to say, at exactly the seven points where
a boot can go wrong.

---

## 3. Memory layout

Everything lives under `/memory` in the tmpfs. After `pivot_root` the same tree is reachable
from the booted system at `/mnt/live/memory`.

| Path | What it is |
|---|---|
| `/memory/data` | Where the medium holding `rl/` gets mounted. |
| `/memory/bundles/<name>.xzm` | One loop-mounted squashfs per module. These are the overlay's lower layers. |
| `/memory/changes` | The writable layer's parent. Either plain tmpfs or persistent (§6). |
| `/memory/changes/upper` | overlayfs `upperdir` — every write to `/` lands here. |
| `/memory/changes/work` | overlayfs `workdir`. Scratch space; must be empty at mount time. |
| `/memory/union` | The assembled root. Becomes `/` after `pivot_root`. |
| `/memory/toram` | Copy of `rl/` when booting with `toram`. |
| `/memory/lowerdirs` | The lower-layer list, lowest priority first, one per line. |
| `/from/DEVICE` | Which device RapidLinux was found on (`savedevice`). |
| `/kernel/` | `vmlinuz` + `irfs.img` copied off the medium (`savekernel`), for the installer. |
| `/var/log/livedbg` | Everything `debug_log` and `echolog` wrote. |

`/memory/lowerdirs` is the single most useful file when a boot goes wrong. It answers "what
got layered, and in what order" without parsing `/proc/mounts`, and it survives into the
booted system.

---

## 4. Finding the data

`find_data` tries three sources, in order:

1. **`rltar=<host>/<path>`** — RapidLinux's own network boot, in `rltar_pxedl.irfs.lib`.
   `custom_init_nics` probes `igb`, `ixgbe`, `e1000e` in that order, keeping whichever adds
   interfaces; picks `eth2` if it exists (a 4-NIC PXE reference box) else `eth0`; gets a
   lease with `udhcpc`, sets MTU 9000, `wget`s `rl.tar`, untars it, then puts the NIC back
   down and unconfigured.
2. **`ip=<client>:<server>:<gw>:<mask>:<port>`** — upstream Linux Live PXE. Fetches
   `PXEFILELIST` over HTTP (port 7529 by default), falls back to TFTP, then pulls each
   listed file.
3. **Local media** — `find_data_try` walks every device `blkid` knows about except
   loop/ram/zram, mounts each read-only, and looks for `$FROM` (default `rl`, overridable
   with `from=`).

A directory counts as RapidLinux data only if **all three** of `base/`, `modules/` and
`optional/` exist inside it — note that `optional/` must be present even though nothing
loads it. The `rltar=` path in `rltar_pxedl.irfs.lib` is stricter still and also requires
`rootcopy/`, so a tarball that omits it fails with `ERROR! COULD NOT DOWNLOAD rl.tar!` even
though the download succeeded. If `$FROM` turns out to be a *file* rather than a directory it
is loop-mounted as an ISO and the search continues inside — that is how booting the ISO from
a USB stick works. On success the medium is remounted rw, `savekernel` copies `vmlinuz` and
`irfs.img` to `/kernel`, and `savedevice` records the device in `/from/DEVICE`.

The whole search is retried once a second for 15 seconds, which is what gives slow USB
enumeration time to settle. Failing that, `fatal`.

### The `rl/` directory contract

| Directory | Loaded when | Notes |
|---|---|---|
| `base/` | always, first | Core modules. Lowest priority. |
| `modules/` | always, second | Overrides `base/`. |
| `optional/` | **never, automatically** | Must exist for detection, but `init` does not load it. Manual staging area. |
| `rootcopy/` | always, last | Copied file-by-file into the union after it is mounted. |

Within `base/` and `modules/`, `sortmod` orders by basename numerically, so `001-core.xzm`
loads before `020-man.xzm`. `load=` and `noload=` are `egrep` patterns applied to the
discovered paths.

One `sortmod` subtlety worth knowing: it sorts with `sort -n`, so a basename that does not
start with a digit counts as **zero** and lands at the front of its directory — that is, at
the *lowest* priority within it. `curlftpfs-0.9.2-x86_64-bksrc1.xzm` sorts ahead of
`001-core.xzm` for that reason. It does not matter today because `modules/` holds a single
bundle and is processed after all of `base/` regardless, but anything added to `modules/`
that needs to override something else there should be given a numeric prefix.

---

## 5. The union

RapidLinux runs on **overlayfs**. It used aufs until 2026; see `AUFS-TO-OVERLAYFS.md` for
why that changed and what it cost.

### The model

```
  /  =  overlay
         upperdir = /memory/changes/upper          <- all writes land here
         workdir  = /memory/changes/work
         lowerdir = <last bundle> : ... : <first bundle>
                         highest priority ----> lowest
```

`mount_bundles` loop-mounts each `.xzm` and prints its mountpoint on stdout; progress goes
to stderr so stdout carries only the list. `init` captures the two calls into
`/memory/lowerdirs`. `init_union` then reads that file and mounts the overlay **once**.

### Ordering: the one thing you must not get wrong

aufs added each bundle to an already-mounted union with `mount -o remount,add:1:`, inserting
it directly under the writable branch. Leftmost wins in aufs, so **the bundle added last had
the highest priority**:

```
[changes] -> [changes,001] -> [changes,020,001] -> [changes,100,020,001]
```

overlayfs `lowerdir=a:b:c` also makes the **leftmost** win, but the list is written in one
go rather than pushed onto. So the discovery order has to be reversed when the string is
assembled. `init_union` does it with a prepend:

```sh
LOWER="$DIR${LOWER:+:$LOWER}"
```

Get this backwards and everything still boots — `rl/modules` just silently stops overriding
`rl/base`, which is a miserable bug to find. `overlayfs-lab/union_harness.sh` test A2 exists
solely to pin it down.

### Mount options, and why

```
lowerdir=...,upperdir=...,workdir=...,xino=auto,redirect_dir=on
```

- **`xino=auto`** restores what aufs got from `xino=/.xino`: a unique `st_ino` across
  branches. Without it, inode numbers can collide between squashfs layers and confuse
  `du`, `find -samefile` and rsync's hardlink detection. `auto` rather than `on` because the
  kernel documents `auto` as enabling the feature "only if the persistent st_ino requirement
  is met" — never-fails semantics, which is what the boot path wants.
- **`redirect_dir=on`** restores aufs's ability to rename a directory that exists only in a
  lower layer. Without it, `mv /usr/share/foo /usr/share/bar` fails with `EXDEV`. It writes
  a `trusted.overlay.redirect` xattr, hence the upper-layer xattr requirement.

Both are accepted regardless of their Kconfig defaults: `CONFIG_OVERLAY_FS_REDIRECT_DIR` and
`CONFIG_OVERLAY_FS_XINO_AUTO` set what you get when the option is *omitted*, they do not gate
the option itself.

Deliberately **not** set, and why:

- **`index=on`** — needed for hardlinks to survive copy-up intact, but it requires working
  file handles on the upper filesystem. Leaving it off matches what aufs did here (its
  `plink` feature was never enabled either), so this is not a regression.
- **`metacopy=on`** — would make `chmod`/`chown` of a large lower file copy up only metadata
  instead of the whole file. A real win for something like `chown -R` across `/usr`, and
  worth revisiting. Off for now to keep the first cut boring.
- **`volatile`** — skips all `sync` to the upper layer. Tempting when `upperdir` is tmpfs and
  nothing is persistent anyway, but it must never be used together with persistent changes.
  Also worth revisiting.

### Ceilings

Two, neither close to being hit:

| Limit | Value | Where it comes from |
|---|---|---|
| `lowerdir=` string | 4096 bytes | `mount(2)` copies its option data into one page. |
| Concurrent bundles | 255 | `CONFIG_BLK_DEV_LOOP_MIN_COUNT=255`. |

Measured at realistic path lengths: the actual RapidBuild64 bundle set (nine in `base/`,
one in `modules/`) produces a 329-byte `lowerdir=`, about 8% of the budget. Synthetic
`/memory/bundles/NNN-module.xzm` paths give 371 bytes at 12 bundles, 1549 at 50, and go over
budget somewhere past 100. `init_union`
refuses to boot above 3800 bytes with a clear message rather than letting the kernel truncate
the option string silently. If a project ever does get close, mount bundles at short numeric
paths instead of basenames.

Kernel 6.7 added `lowerdir+=` via the new mount API, which removes the length limit — but it
does **not** allow adding layers to a mounted union, so it would not change anything else
here.

### Bundle names

`mount_bundles` skips any bundle whose mountpoint would contain `,`, `:` or `\`. A comma
terminates a mount option and a colon separates `lowerdir` entries, and neither can be
escaped through the classic `mount(2)` option string. Rejecting the bundle with a visible
message beats corrupting the union.

It also skips a bundle whose mountpoint is already mounted, since a repeated path makes
overlayfs reject the entire union as overlapping.

---

## 6. Persistent changes

Off unless `perch` is on the kernel command line. **No shipped boot entry passes it**, so in
practice the writable layer is always tmpfs and every change is lost at reboot. The machinery
is described here because it is still in the code.

`persistent_changes` runs before `copy_to_ram` and decides what `/memory/changes` will be:

1. Is `$DATA/changes` writable at all? If not, say so and give up.
2. `overlay_upper_ok` — can it actually back an overlayfs upper layer?
   - **Yes** → `mount --bind` it onto `/memory/changes`. Done.
   - **No** → the dynfilefs path below.

### `overlay_upper_ok`

overlayfs is much pickier about its upper layer than aufs was. It needs `trusted.*` extended
attributes to mark opaque directories, a valid `d_type` in readdir, and character-device
`0:0` whiteouts; and it refuses case-folding filesystems such as vfat outright. The probe
this replaced only tested symlinks and the executable bit, which proves none of that. So the
current probe asks the filesystem and then overlayfs itself, in that order: first `mknod` a
character device 0:0 on the bare directory, then mount a throwaway overlay using it as an
upper layer. Both have to succeed. The order matters — writing into a layer of an overlay
that is already mounted is the "underlying filesystem changed" case the kernel documents as
undefined, so the whiteout test has to happen before the mount, not through it. Everything
is cleaned up either way.

### dynfilefs, and why that branch is dead

**DynFileFS** is a FUSE filesystem by Tomas Matejicek. It presents a virtual file of a
declared size — 4000 MB here — backed by an indexed store that only grows as blocks are
actually written. It exists for exactly one situation: persistent changes on a FAT32 or NTFS
stick. The writable layer needs POSIX semantics that FAT cannot provide, so the trick is to
put a real ext2 filesystem *inside a file* on the stick and loop-mount it; and since FAT32
has no sparse files, creating a 4 GB file honestly would mean writing 4 GB. DynFileFS fakes
the sparseness in userspace.

```sh
mount.dynfilefs "$CHANGES/changes.dat" 4000 "$2"   # virtual loop.fs appears at $2
mke2fs -F "$2/loop.fs"                             # if blkid finds no filesystem yet
mount -o loop,sync "$2/loop.fs" "$2"               # stack the ext2 over the same path
```

Note the deliberate double mount on the same path — dynfilefs mounts there, then the loop
mount stacks on top. That is why `cleanup` unmounts twice and lazily.

**This cannot fire in RapidLinux.** `mount.dynfilefs` is a separate libfuse-linked binary
from the linux-live source tree and `mke2fs` is e2fsprogs, and `04-prep_irfs.sh` installs
neither. The branch is kept for parity with upstream, and guarded: if the loop mount did not
happen, or if the result cannot back an overlay, it says so and returns with persistence
disabled instead of pretending.

---

## 7. Kernel command line

Read by the initramfs:

| Parameter | Read by | Effect |
|---|---|---|
| `debug` | `debug_start`, `debug_shell`, `cleanup` | Verbose logging and a root shell at each boot stage. |
| `toram` | `copy_to_ram` | Copy `rl/` into RAM and release the medium. Set on every shipped entry. |
| `perch` | `persistent_changes` | Enable persistent changes. Not set by any shipped entry. |
| `from=<path>` | `find_data` | Where to look for the data directory. Default `rl`. |
| `load=<pattern>` | `filter_load` | `egrep` pattern; only matching bundles are loaded. |
| `noload=<pattern>` | `filter_noload` | `egrep` pattern; matching bundles are skipped. |
| `ip=c:s:g:m:p` | `download_data_pxe` | Upstream PXE boot over HTTP, falling back to TFTP. |
| `rltar=<host>/<path>` | `download_rl_tarball` | RapidLinux tarball network boot. |
| `noeject` | `autoejectcdrom` | Do not auto-eject the CD when copying to RAM. |

Read later by `/etc/rc.d/rc.rl_init` in the booted system, listed here because people look
for them in one place:

| Parameter | Effect |
|---|---|
| `roothome=<path>` | Override root's home directory. |
| `rootpasswd=<hash>` | Set root's password. |
| `ntps=<server>` | NTP server. |
| `staticip=<colon-separated>` | Static network configuration. |
| `osharden` | Apply the hardening profile. |

Shipped entries in `RLBFILES/boot/`: isolinux/syslinux both `INCLUDE /boot/rl.cfg`, which
appends `rw vga=791 toram` (or `rw vga=791 nohz=off` for the VM entry); `grub.cfg` and
`refind.conf` use `rw toram`.

---

## 8. Debugging a boot

Add `debug` to the kernel command line. You get a root shell at each of the seven stages
listed in §2; `Ctrl+D` continues. From those shells, in rough order of usefulness:

```sh
grep -w overlay /proc/filesystems   # is overlayfs there at all?
cat /memory/lowerdirs               # which bundles mounted, lowest priority first
mount | grep squashfs               # every bundle, with its loop device
mount | grep ' / '                  # the union and its full option string
cat /var/log/livedbg                # everything debug_log wrote
dmesg | grep -i overlay             # the kernel's own complaints
```

A healthy union looks like this (wrapped for readability):

```
overlay /memory/union overlay rw,relatime,
  lowerdir=/memory/bundles/100-extra.xzm:/memory/bundles/020-man.xzm:/memory/bundles/001-core.xzm,
  upperdir=/memory/changes/upper,workdir=/memory/changes/work,
  redirect_dir=on,xino=auto
```

Note the lowerdir order: highest-numbered bundle **first**.

Failure modes and what they mean:

| Symptom | Cause |
|---|---|
| `this kernel has no overlayfs support` | `CONFIG_OVERLAY_FS` missing from the kernel. |
| `no filesystem bundles could be mounted` | `/memory/lowerdirs` came out empty — nothing matched, or every loop mount failed. Check `load=`/`noload=`. |
| `too many bundles ... lowerdir option too long` | Over the one-page limit (§5). |
| `could not mount the overlayfs union` | See `dmesg`. Usually the upper layer: no xattrs, or a filesystem overlayfs refuses. |
| `! <bundle> skipped, unsupported character in path` | Bundle name contains `,` `:` or `\`. Rename it. |
| Boots, but a module's files are missing | Ordering. Check `/memory/lowerdirs` against `mount`. |

`fatal` prints the message and drops to a shell on tty1 rather than panicking, so there is
always something to inspect.

---

## 9. Shutdown

Wired in by `RLBFILES/patches/rc-241024/rc.6-03-cleanup.diff`, which replaces the tail of
Slackware's `rc.6`:

```sh
if [ -x /mnt/live/cleanup ]; then
  exec /mnt/live/cleanup --start ${shutdown_command}
fi
```

`cleanup` runs in two phases:

**`--start`** — still running under the old root. Copies itself to `/mnt/live/sbin/init`,
`pivot_root`s back so the union is no longer the root and can be unmounted, records
`reboot` or `poweroff` in `/lib/command`, then `telinit u` to make init re-exec — which now
means re-execing `cleanup`.

**`--init`** — now PID 1, everything else already killed. Remounts `/proc` and `/sys`,
detaches unused loop devices, then unmounts **in reverse order of `/proc/mounts`**:

```sh
tac /proc/mounts | grep union  | ...   # the union and anything mounted inside it
tac /proc/mounts | grep loop   | ...   # the squashfs bundles
tac /proc/mounts | grep memory | ...   # /memory/* including changes and data
```

The order is the whole point: the union has to go before the lower layers and the upper
layer it is built from. It matches on the `/memory/union` *path*, not on a filesystem type,
which is why the aufs-to-overlayfs switch needed no change here at all. Finally it ejects
the CD if that is where we booted from, and calls `reboot -f` or `poweroff -f`.

`--killall5` exists but is not used; the comment says it broke on newer Slackware.

---

## 10. Kernel requirements

Verified present in the 6.1.118 RapidLinux kernel — **nothing needs changing**:

```
CONFIG_OVERLAY_FS=y             the union. Built in, so modprobe is a no-op and
                                the initramfs never depends on modules.dep
CONFIG_SQUASHFS=y               the .xzm bundle format
CONFIG_SQUASHFS_XZ=y            ... its compressor
CONFIG_BLK_DEV_LOOP=y           bundles are loop mounts
CONFIG_BLK_DEV_LOOP_MIN_COUNT=255
CONFIG_TMPFS=y
CONFIG_TMPFS_XATTR=y            REQUIRED: upperdir lives on the tmpfs from
                                transfer_initramfs, and overlayfs needs trusted.*
                                xattrs there for opaque dirs and redirect_dir
CONFIG_RD_LZMA=y                irfs.img is cpio piped through lzma
```

What breaks without each:

| Missing | Result |
|---|---|
| `CONFIG_OVERLAY_FS` | `init_overlay` calls `fatal` with a clear message. Nothing boots. |
| `CONFIG_SQUASHFS` / `_XZ` | Every bundle fails to mount; `init_union` reports an empty lower list. |
| `CONFIG_BLK_DEV_LOOP` | Same. |
| `CONFIG_TMPFS_XATTR` | Mounts fine, then misbehaves: overlayfs logs *"upper fs does not support xattr, falling back to index=off, metacopy=off and no redirect_dir"*, and `rm -rf` of a lower-only directory followed by `mkdir` resurfaces the lower contents. |
| `CONFIG_RD_LZMA` | The kernel cannot unpack `irfs.img`. Nothing boots. |

These are *defaults only* and need not be set, since the mount options are passed
explicitly: `CONFIG_OVERLAY_FS_REDIRECT_DIR`, `CONFIG_OVERLAY_FS_XINO_AUTO`,
`CONFIG_OVERLAY_FS_INDEX`, `CONFIG_OVERLAY_FS_METACOPY`.

`CONFIG_TMPFS_INODE64=y` is set and is harmless. It widens the tmpfs inode-number *space* to
64 bits while `xino` wants to compose its layer index into the high bits — but tmpfs still
allocates inode numbers sequentially from a low counter, and if one ever did reach those
bits, overlayfs falls back to non-xino behaviour for that inode alone, rate-limited, without
failing the mount.

`CONFIG_AUFS_FS=y` is still set as of this writing. It is unused now and can be dropped
along with the aufs patch series whenever the kernel is next rebuilt.

Check a kernel with:

```sh
zcat /proc/config.gz | grep -E 'OVERLAY_FS|SQUASHFS|BLK_DEV_LOOP|TMPFS|RD_LZMA'
```

---

## 11. Vestigial code

Flagged so nobody spends an afternoon working out why it does nothing.

| What | Status |
|---|---|
| The dynfilefs branch in `persistent_changes` | Cannot fire: `mount.dynfilefs` and `mke2fs` are not in the image (§6). |
| `modprobe fuse` in `init_devs` | Left over from dynfilefs and ntfs-3g. Nothing in the initramfs uses FUSE. |
| `ntfs-3g` in `device_bestfs` | `ntfs-3g` is not in the image either, so an NTFS medium falls back to whatever the kernel offers. |
| `init_zram` | Commented out in `init`; zram is a module and is not loaded this early. |
| `create_bundle` in `livekit.irfs.lib` | Never called at boot. Build-time module creation goes through `dir2xzm` / `liblinuxlive`. |
| `liblinuxlive`'s own `copy_to_ram` -> `list_modules` -> `find_modules` | The chain is intact but inert: `find_modules` searches for `*.lzm`, not `*.xzm`, so it has matched nothing since the format changed. Note `liblinuxlive` has a `copy_to_ram` of its own, unrelated to the one in `livekit.irfs.lib` that the initramfs actually uses. |
| `mount_module` and `find_n_run_scripts` in `liblinuxlive` | Orphaned by the overlayfs switch — their only callers were `union_insert_module` and the deleted `activate`/`deactivate`. Both are generic and harmless, so they were left in place rather than widening the diff. |
| The path globals at the top of `liblinuxlive` (`UNION`, `MEMORY`, `CHANGES`, `XINO`, `COPY2RAM`, `IMAGES`, `INITRAMDISK`, `LOOPMOUNT`, `MOUNTDIR`) | All nine are referenced zero times, and already were before the overlayfs switch. They configure nothing; do not trust them as a source of truth for where anything lives. §3 is the real layout. |
| `/memory/bundles` vs `/memory/images` | Boot-time bundles mount under `bundles/`; the deleted `activate` used `images/`. Only `bundles/` is used now. |
| `optional/` | Required to exist for media detection, never loaded by `init`. |

None of it is load-bearing. It is all kept to stay close to upstream Linux Live Kit, which
makes future merges easier to read.
