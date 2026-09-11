# Approved plan — aufs to overlayfs

**This is a historical record, not current truth.** It is the implementation plan exactly as
approved on 2026-09-11, before any code was written, copied into the repo so the reasoning
travels with the work. It has deliberately **not** been edited to match what was built.

For what is actually done and what is still outstanding, read
[`../RapidBuild64/baseoutput/RLBFILES/irfs/AUFS-TO-OVERLAYFS.md`](../RapidBuild64/baseoutput/RLBFILES/irfs/AUFS-TO-OVERLAYFS.md)
§Status. For the subsystem itself, read `INITRAMFS.md` beside it.

Line numbers quoted below (`lines 183–191`, etc.) refer to the files *before* the change.

## Where reality diverged from this plan

Everything in §1–§5 was implemented as written. Three things in §6 did not survive contact:

1. **§6 claims this host "can run 1–5 with plain directories".** It cannot. The dev container
   has no `CAP_SYS_ADMIN` — not merely missing `mksquashfs`, but unable to mount anything at
   all, `tmpfs` included. The plan had checked for `overlay` in `/proc/filesystems` and
   wrongly inferred that mounting would work.
2. **So the harness was restructured** into **Group A** (pure logic, no privileges, runs
   anywhere — 10 assertions) and **Group B** (real mounts, needs root + `CAP_SYS_ADMIN` — 13
   assertions), so it degrades honestly instead of reporting a partial run as success. The
   plan's items 1–5 became B1–B5; B6 and all of Group A are new.
3. **A negative control was added to B4**, beyond the plan: the same directory rename must
   *fail* with `redirect_dir=off`. Without it the test would pass on a kernel where the
   option was a no-op, proving nothing.

Also done beyond the plan: the real `mount_bundles` → `/memory/lowerdirs` → `init_union` flow
was dry-run with `mount` stubbed, which is what confirmed the ordering end-to-end before any
hardware was involved. That scratch script was not committed — see the "Why it duplicates
production code" section of `README.md` for why nothing here links the production library.

---

*Verbatim copy of the approved plan follows.*

# Switch the RapidLinux initramfs from aufs to overlayfs

## Context

RapidLinux's live-CD root is an aufs union: a writable branch (`/memory/changes`)
with every `.xzm` (xz-squashfs) bundle loop-mounted and pushed onto the union with
`mount -o remount,add:1:`. aufs is **not** in mainline Linux, so every kernel build at
`${PACKAGESDIR}/rapidkernels/64/6.1.118/` has to carry the aufs patch series. Requirement
#1 is to stop patching the kernel.

**The 6.1.118 kernel already has `CONFIG_OVERLAY_FS=y` built in**, so no kernel rebuild is
needed to make the switch — this is purely an initramfs change, and dropping the aufs patch
series becomes a separate follow-up once it boots (§4).

**overlayfs is the only real option.** Erez Zadok's unionfs was never merged and has been
unmaintained since ~2014 — using it means patching the kernel, which is the thing we are
removing. unionfs-fuse needs no patch but is a FUSE daemon in userspace: unsuitable as the
root filesystem (pivot_root onto FUSE, the daemon living inside the root it serves, and a
syscall round-trip per operation). overlayfs has been mainline since 3.18, is what Docker,
podman, systemd and OSTree all use, and is already `CONFIG_OVERLAY_FS` away in any 6.1 tree.

**xz-squashfs `.xzm` modules are unaffected.** overlayfs takes any directory as a lower
layer, including a loop-mounted squashfs. No module format change, no rebuild of modules,
no change to `dir2xzm` / `xzm2dir` / `mksquashfs` invocations.

**The one thing we lose is on-the-fly module activation.** overlayfs fixes its layer list at
mount time — there is no equivalent of aufs `remount,add:` / `remount,del:` on a mounted
union. This is not a gap we can close; it is exactly why Slax reverted to aufs after trying
overlayfs in the Debian-based 9.x series. Per your decision, `activate` and `deactivate` are
being **deleted** rather than faked. `xzm2dir mod.xzm /` (already what `activate`'s own error
message suggests) remains the runtime escape hatch, and dropping a module into `rl/modules`
and rebooting remains the supported path.

### What does and does not change about module loading

aufs mounted the union *empty* (writable branch only) and pushed each `.xzm` onto the live
union one at a time with `add:1:` — insert at index 1, directly under the writable branch at
index 0. Leftmost wins in aufs, so **the last bundle added had the highest priority**, which
is what makes `rl/modules` override `rl/base` and makes `sortmod`'s numeric ordering work:

```
[changes] -> [changes,001] -> [changes,002,001] -> [changes,020,002,001] -> [changes,curlftpfs,020,002,001]
```

**The discovery sequence does not change.** Same `find | sortmod | filter_load | grep .xzm |
filter_noload` walk, same order, `base` then `modules`, same one-at-a-time
`mount -o loop -t squashfs`. Only the *moment the union is mounted* moves: after the walk
instead of before it.

**Nothing has to be known at build time or baked into the ISO.** Discovery stays fully
dynamic at boot — init still walks whatever `.xzm` files happen to be in `$DATA/base/` and
`$DATA/modules/` on that disc or stick. No manifest, no list in the initramfs. "Known at
mount time" only means the walk must *finish* before the single `mount -t overlay` runs, a
few hundred milliseconds earlier in the same boot, driven by the same code.

The one behavioural trap is direction: `add:1:` made the **last** bundle win, `lowerdir=a:b:c`
makes the **leftmost** win, so the collected list must be reversed (§1c). The only genuine
loss is *after* that mount completes — no layer can be added to a live overlay, which is the
`activate`/`deactivate` removal above.

Scope is small: exactly **5 files** in the tree mention aufs, 22 lines total. `RapidBuild64`
is the single source — the other 11 projects symlink `baseoutput/RLBFILES/irfs` and
`04-prep_irfs.sh` into it, so editing once changes all 12 ISOs.

**Working area:** `/root/code/mygithub/RapidBuilds.claude_switch_overlayfs` (branch
`claude_switch_overlayfs`, currently identical to master). Everything — code and docs — lands
there. The two unionfs directories/branches get no work; you're deleting them.

---

## 1. `RapidBuild64/baseoutput/RLBFILES/irfs/livekit.irfs.lib`

The load-bearing file. Six edits.

### 1a. `init_aufs()` → `init_overlay()` (lines 183–191)

Replaces `modprobe aufs 2>/dev/null` and finally answers the existing
`# TODO maybe check here if aufs support is working at all`:

```sh
init_overlay()
{
  debug_log "init_overlay" "$*"
  modprobe overlay 2>/dev/null
  if ! grep -qw overlay /proc/filesystems; then
    fatal "this kernel has no overlayfs support (CONFIG_OVERLAY_FS)"
  fi
}
```

### 1b. `union_append_bundles()` → `mount_bundles()` (lines 625–640)

Stops touching the union. Mounts each squashfs and **prints its mountpoint on stdout**;
all progress output moves to stderr, the same convention `find_data()` already uses.

```sh
# Mount squashfs bundles and print their mountpoints, one per line,
# lowest-priority first
# $1 = directory to search for bundles   $2 = where to mount them
# $3 = <base|modules>
mount_bundles()
{
  debug_log "mount_bundles" "$*"
  local BUN

  echo_green_star >&2
  echo "Adding $3 to union" >&2
  ( cd "$1" ; find "$3/" 2>/dev/null | sortmod | filter_load) | grep '[.]xzm$' | filter_noload | while read BUNDLE; do
    echo "* $BUNDLE" >&2
    BUN="$(basename "$BUNDLE")"
    case "$2/$BUN" in
      *[,:\\]*) echo "! $BUNDLE skipped, unsupported character in path" >&2; continue ;;
    esac
    if mountpoint -q "$2/$BUN" 2>/dev/null; then
      echo "! $BUNDLE skipped, already mounted" >&2; continue
    fi
    mkdir -p "$2/$BUN"
    if mount -o loop -t squashfs "$1/$BUNDLE" "$2/$BUN" 2>/dev/null; then
      echo "$2/$BUN"
    else
      echo "! $BUNDLE could not be mounted" >&2
      rmdir "$2/$BUN" 2>/dev/null
    fi
  done
}
```

The `case` guard matters: `,` terminates a mount option and `:` separates lowerdirs, so a
bundle whose name contains either would silently corrupt the option string. The
`mountpoint -q` guard mirrors the `ismountpoint` check `union_insert_module` already had —
a duplicate mountpoint would make overlayfs reject the whole mount as overlapping.
`mountpoint` is already used by `mounted_dir()`, so it is present in this busybox.

### 1c. `init_union()` — rewritten (lines 197–207)

Now the **last** step, taking the accumulated lower list, and mounting once.

```sh
# $1 = changes directory   $2 = union mountpoint
# $3 = file listing lower branches, lowest priority first
init_union()
{
  debug_log "init_union" "$*"
  local DIR LOWER UPPER WORK

  echo_green_star
  echo "Setting up union"

  UPPER="$1/upper"
  WORK="$1/work"
  mkdir -p "$2" "$UPPER"
  rm -rf "$WORK" 2>/dev/null      # overlayfs requires an empty workdir
  mkdir -p "$WORK"

  # aufs pushed each bundle on with add:1:, so the last one pushed won.
  # overlayfs reads lowerdir= highest-priority-first, so build the list backwards.
  LOWER=""
  while read DIR; do
    if [ "$DIR" != "" ]; then LOWER="$DIR${LOWER:+:$LOWER}"; fi
  done < "$3"

  if [ "$LOWER" = "" ]; then fatal "no filesystem bundles were mounted"; fi
  debug_log "lowerdir is ${#LOWER} bytes"
  if [ ${#LOWER} -gt 3800 ]; then
    fatal "too many bundles to mount in one overlay (lowerdir option too long)"
  fi

  mount -t overlay -o "lowerdir=$LOWER,upperdir=$UPPER,workdir=$WORK,xino=auto,redirect_dir=on" \
    overlay "$2" || fatal "could not mount the overlayfs union"
}
```

Three things to be deliberate about:

- **Order reversal is mandatory.** `add:1:` inserts just under the writable branch, so with
  `sortmod` ascending, the highest-numbered module ended up with the highest priority, and
  `rl/modules` overrode `rl/base`. `lowerdir=a:b:c` is leftmost-wins, so the list must be
  reversed to preserve that. The `${LOWER:+:$LOWER}` prepend does it for free.
- **`upperdir`/`workdir` must be siblings on one filesystem**, and workdir must be empty —
  hence the `$CHANGES/upper` + `$CHANGES/work` split instead of using `$CHANGES` directly
  the way aufs's `br=` did.
- **The option string is capped at one page (4096 bytes)** on 6.1 — overlayfs only gained the
  new mount API (`fsconfig` + `lowerdir+=`, no length limit) in 6.7, and even that would not
  let us add layers to a *mounted* union. RapidBuild64 ships ~10 modules, so the real string
  is well under 1 KB; the 3800-byte guard turns a silent truncation into a clear boot error.
  If a project ever gets near it, mount bundles at short numeric paths instead of basenames.
  The other ceiling is `CONFIG_BLK_DEV_LOOP_MIN_COUNT=255` — 255 concurrently loop-mounted
  bundles. Both belong in `INITRAMFS.md` §5; neither is close to being hit today.

Mount options chosen:

- **`xino=auto`** restores aufs's `xino=/.xino` behaviour — unique `st_ino` across branches,
  without which `du`, `find -samefile` and rsync hardlink detection can be fooled by inode
  collisions between squashfs layers. `auto` rather than `on` deliberately: the kernel docs
  define `auto` as "enable the feature only if the persistent st_ino requirement is met",
  which is precisely the never-fails semantics wanted on the boot path.
- **`redirect_dir=on`** restores aufs's ability to rename a lower-only directory, which
  otherwise fails `EXDEV`. Note both options are accepted regardless of their Kconfig
  defaults — `CONFIG_OVERLAY_FS_REDIRECT_DIR` / `_XINO_AUTO` set the *default*, they do not
  gate the mount option (see §4).
- Deliberately **not** set: `index=on` (needs exportfs on the upper; leaving it off matches
  today's aufs-without-plink hardlink behaviour), `metacopy=on` and `volatile` — both worth
  revisiting as tuning once it boots, documented in `INITRAMFS.md` §5.

### 1d. New helper `overlay_upper_ok()`, used by `persistent_changes()` (lines 477–525)

overlayfs is pickier about its upper than aufs was: it needs `trusted.*` xattrs, valid
`d_type`, and char-device whiteouts, and it rejects case-folding filesystems (vfat) outright.
The existing symlink/chmod "posix compatibility" probe does not test any of that. Replace it
with a probe that asks overlayfs directly:

```sh
overlay_upper_ok()
{
  local T R
  T="$1/.ovlprobe"; R=1
  rm -rf "$T" 2>/dev/null
  mkdir -p "$T/l" "$T/u" "$T/w" "$T/m" 2>/dev/null || { rm -rf "$T" 2>/dev/null; return 1; }
  if mount -t overlay -o "lowerdir=$T/l,upperdir=$T/u,workdir=$T/w" overlay "$T/m" 2>/dev/null; then
    mknod "$T/u/probe" c 0 0 2>/dev/null && R=0   # whiteout support, tested on the raw fs
    umount "$T/m" 2>/dev/null
  fi
  rm -rf "$T" 2>/dev/null
  return $R
}
```

Wire it into `persistent_changes()` in place of the posix test, and run it again after the
dynfilefs loop is mounted. When it fails, print a clear message and return without
persistence rather than handing overlayfs an upper it will refuse.

Leave the dynfilefs branch itself in place — but document it, because it is **already dead**
and that is not obvious from reading the code. DynFileFS is a FUSE filesystem by Tomas
Matejicek that presents a virtual file of a declared size (here 4000 MB) backed by an indexed
store that only grows as blocks are written. It exists so persistent changes can work on a
FAT32/NTFS stick: the union's writable branch needs POSIX semantics that FAT cannot provide,
so a real ext2 filesystem is put *inside a file* on the stick and loop-mounted. The POSIX
probe (write / symlink / toggle `+x`) decides which path is taken — bind-mount the changes
directory when it passes, dynfilefs + `mke2fs` + loop mount when it fails. Note the
deliberate double mount on `$2`, which is why `cleanup` unmounts twice and lazily.

It cannot fire in RapidLinux: `mount.dynfilefs` is a separate libfuse-linked binary and
`mke2fs` is e2fsprogs, and `04-prep_irfs.sh` installs only busybox, the kmods tree and the
four irfs scripts. On a FAT stick the branch fails at `mount.dynfilefs: not found`, the loop
mount fails too, and `persistent_changes` falls through leaving `/memory/changes` an empty
tmpfs dir — persistence silently does not happen. The `modprobe fuse` in `init_devs` and the
`ntfs-3g` handling in `device_bestfs` are leftovers from the same era. Moot in practice: no
boot entry passes `perch`.

### 1e. `fstab_create()` (line 651) and `change_root()` (lines 679, 693–694)

```sh
echo overlay / overlay defaults 0 0 > $FSTAB
...
if [ ! -e sbin/fsck.overlay ]; then ln -s /bin/true sbin/fsck.overlay; fi
...
mount -n -o remount,ro overlay . || echo "! could not remount the union read-only" >&2
```

`ovl_remount()` only rejects remount **rw** when there is no upper layer, so both this
`remount,ro` and Slackware `rc.S`'s later "Remounting root device with read-write enabled"
work. The `||` is there so a surprise cannot wedge the boot right before `pivot_root`.
`pivot_root` onto overlayfs is fine — it is what every container runtime does.

---

## 2. `RapidBuild64/baseoutput/RLBFILES/irfs/init`

Add one path variable next to the others, and reorder so bundles are mounted **before** the
union is created. Keep the off-screen `debug_shell` padding lines as they are.

```sh
BUNDLES=$MEMORY/bundles
LOWERS=$MEMORY/lowerdirs        # new
...
init_devs
init_overlay                    # was: init_aufs
...
DATA="$(copy_to_ram "$DATA" "$CHANGES")"

# mount the bundles first — overlayfs needs every lower branch up front
mount_bundles "$DATA" "$BUNDLES" "base"    >  "$LOWERS"
mount_bundles "$DATA" "$BUNDLES" "modules" >> "$LOWERS"

# init the overlayfs union
init_union "$CHANGES" "$UNION" "$LOWERS"
```

The list file also survives into the booted system as `/mnt/live/memory/lowerdirs`, which
makes "what got layered, in what order" answerable without parsing `/proc/mounts`.

---

## 3. `RapidBuild64/001-core/` — remove the aufs-only runtime tooling

- **Delete** `RLBFILES/rootcopy/usr/bin/activate` and `RLBFILES/rootcopy/usr/bin/deactivate`.
- `02r-rootcopy.sh:58` — drop `activate deactivate` from the `chmod 0700` list, leaving
  `for FILE in deb2xzm dir2xzm rpm2xzm txz2xzm xzm2dir; do`.
- `RLBFILES/rootcopy/usr/lib/liblinuxlive` — remove `union_insert_dir()` (487–491),
  `union_insert_module()` (530–546) and `union_insert_modules()` (552–561); these are the
  only three functions carrying `remount,add:1:`.
- `liblinuxlive:978` — `fstab_add_line $FSTABTMP overlay / overlay defaults`.

Nothing else references `activate`/`deactivate` (the `bin/activate` hits under `003-interp`
are Python virtualenv docs, unrelated). `find_modules`/`list_modules` become orphaned but
were already dead — they search for `*.lzm`, not `*.xzm` — so leave them; likewise
`find_n_run_scripts`, which is generic.

---

## 4. Kernel side — **no rebuild required**

The 6.1.118 kernel already has what this needs. From `/proc/config.gz` on the build box:

```
CONFIG_OVERLAY_FS=y                            <- built in, exactly what we want
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set    <- default only; redirect_dir=on still accepted
CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y     <- good: our redirects are always followed
# CONFIG_OVERLAY_FS_INDEX is not set           <- what we want anyway
# CONFIG_OVERLAY_FS_XINO_AUTO is not set       <- default only; xino=auto still accepted
# CONFIG_OVERLAY_FS_METACOPY is not set        <- what we want anyway
CONFIG_SQUASHFS=y  CONFIG_SQUASHFS_XZ=y  CONFIG_SQUASHFS_XATTR=y
```

The four `is not set` lines are **Kconfig defaults, not availability gates**:
`ovl_parse_redirect_mode()` and the `xino=` parser accept those values unconditionally; the
Kconfig symbols only decide what you get when the option is omitted. Since `init_union`
passes both explicitly, nothing is missing. `CONFIG_BLK_DEV_LOOP` and `CONFIG_RD_LZMA` are
necessarily present already — today's ISO would not boot without them.

The supporting symbols are confirmed present too:

```
CONFIG_RD_LZMA=y                  <- 07-stamp_iso.sh pipes cpio through lzma
CONFIG_BLK_DEV_LOOP=y             <- squashfs bundles are loop mounts
CONFIG_BLK_DEV_LOOP_MIN_COUNT=255 <- ceiling of 255 concurrently mounted bundles
CONFIG_TMPFS=y  CONFIG_TMPFS_POSIX_ACL=y  CONFIG_TMPFS_XATTR=y
CONFIG_TMPFS_INODE64=y
CONFIG_AUFS_FS=y                  <- still built in; see sequencing below
```

`CONFIG_TMPFS_XATTR=y` was the one that mattered and it is set (pulled in by
`TMPFS_POSIX_ACL`, since it is `default n` in `mm/Kconfig` on its own). The overlay's
`upperdir` lives on the tmpfs that `transfer_initramfs` creates, and without it overlayfs
would log *"upper fs does not support xattr, falling back to index=off, metacopy=off and no
redirect_dir"* and carry on — which would make `rm -rf` of a lower-only directory followed by
`mkdir` resurface the lower contents. Not an issue here.

`CONFIG_TMPFS_INODE64=y` is worth a line in the docs but is not a problem: it widens the
tmpfs inode-number *space* to 64 bits, and `xino` composes its fsid index into the high bits.
tmpfs still allocates inode numbers sequentially from a low counter, so they will not reach
those bits; and if one ever did, overlayfs falls back to non-xino behaviour **for that inode
only**, rate-limited, without failing the mount. `xino=auto` keeps this entirely safe.

**Consequence for sequencing — this is the useful part.** `CONFIG_AUFS_FS=y` is still in the
same kernel, so both filesystems are available simultaneously. The overlayfs ISO and the
current aufs ISO can be A/B tested on the identical kernel image, and rollback is just
booting the old ISO. Removing the aufs patch series and `CONFIG_AUFS_FS` from the
out-of-tree kernel build becomes a **separate, later cleanup** rather than a prerequisite.
Do the initramfs work first, confirm it boots, then drop the patch.

No build-script change is needed either way: `04-prep_irfs.sh:15` explodes the *entire*
`000-kmods-${KERNVERS}.xzm` into the initramfs, and `01z-clean_kmods.sh` (VPS64,
IntelLaptop64) prunes drivers but never touches `kernel/fs/`. With `CONFIG_OVERLAY_FS=y` the
`modprobe overlay` in `init_overlay()` is a harmless no-op and the `/proc/filesystems` check
is what actually guards the boot.

---

## 5. Documentation

The initramfs is the least-documented and highest-consequence part of the project, so the
main deliverable is a complete engineering reference, not just a migration note. Both docs go
**under `RapidBuild64/baseoutput/RLBFILES/irfs/`**, next to the code they describe.
`04-prep_irfs.sh` installs only the four named files, so extra files in that directory are
never shipped in the image.

### `RLBFILES/irfs/INITRAMFS.md` — complete engineering reference

Describes the initramfs as it is *after* this change, in enough detail that someone can debug
a failed boot without reading every line of `livekit.irfs.lib`:

1. **What ships and how it is built** — `04-prep_irfs.sh` (busybox from
   `${PACKAGESDIR}/busybox/`, the whole `000-kmods-${KERNVERS}.xzm` tree, `/usr` deleted,
   `/bin -> sbin`, `/sbin/sh -> busybox`, the four scripts), then `07-stamp_iso.sh`
   (`find . | cpio -H newc -o | lzma > boot/irfs.img`). Note `01z-clean_kmods.sh` pruning in
   VPS64/IntelLaptop64 and that it never touches `kernel/fs/`.
2. **Boot flow, end to end** — kernel → `/init` → busybox applet install → sourcing
   `/lib/*.irfs.lib` → `transfer_initramfs` (tmpfs + `switch_root`, and *why*: pivot_root
   refuses to work out of a real initramfs) → `init_proc_sysfs` → `init_devs` →
   `init_overlay` → `find_data` → `persistent_changes` → `copy_to_ram` → `mount_bundles` ×2
   → `init_union` → `copy_rootcopy_content` → `fstab_create` → `change_root`
   (`remount,ro` → `pivot_root . mnt/live` → `chroot . /sbin/init`).
3. **Memory layout** — the contract for `/memory/{data,bundles,changes,union,toram,lowerdirs}`
   and what each becomes after pivot_root under `/mnt/live/`.
4. **Finding the data** — the `base` + `modules` + `optional` + `rootcopy` directory contract,
   `from=`, the ISO-within-a-device loop remount, `savekernel`/`savedevice`, PXE (`ip=`) and
   the RapidLinux `rltar=` path in `rltar_pxedl.irfs.lib`.
5. **The union** — the overlayfs model, the priority-ordering rule and why the list is
   reversed, each mount option and the reason for it, the tuning knobs deliberately left off
   (`metacopy=on`, `volatile` when there is no persistence, `index=on`), the one-page option
   length limit, and what aufs did before for anyone reading old notes.
6. **Persistent changes** — `perch`, the POSIX probe, the new `overlay_upper_ok()` probe,
   dynfilefs explained in full (§1d), and a clear statement that the whole feature is
   currently inert because no boot entry passes `perch` and the dynfilefs binaries are absent.
7. **Boot parameters** — complete table: `debug`, `toram`, `perch`, `from=`, `load=`,
   `noload=`, `ip=`, `rltar=`, `noeject`, plus the `rc.rl_init` ones (`roothome=`,
   `rootpasswd=`, `ntps=`, `staticip=`, `osharden`), each with the function that reads it.
8. **Debugging a boot** — the `debug` parameter and the `debug_shell` calls hidden at column
   ~150 in `init`, `/var/log/livedbg`, reading `/mnt/live/memory/lowerdirs`, and what a
   healthy `mount` output looks like.
9. **Shutdown** — `cleanup --start` / `--init`, how `rc.6-03-cleanup.diff` wires it in, the
   reverse unmount ordering and why the union must go before its lowers and upper.
10. **Kernel requirements** — the §4 config block, and what breaks if each is missing.
11. **Vestigial code, flagged honestly** — dynfilefs, `ntfs-3g`, `modprobe fuse`, the
    commented-out `init_zram`, `create_bundle` (unused at boot), `liblinuxlive`'s `*.lzm`
    search, and the `/memory/bundles` vs `/memory/images` split.

### `RLBFILES/irfs/AUFS-TO-OVERLAYFS.md` — migration decision record

Why overlayfs; why neither unionfs variant qualifies under the no-kernel-patch requirement
(Zadok's unionfs never mainlined and unmaintained since ~2014; unionfs-fuse is a FUSE daemon,
wrong shape for a root filesystem); what changed file by file; what was removed
(`activate`/`deactivate` and the three `union_insert_*` functions) and what replaces it
(`xzm2dir mod.xzm /`, or `rl/modules` + reboot); behaviour differences vs aufs, including
that `xino`/`redirect_dir` state written into a *persistent* upper can go stale if the module
set changes between boots. Also records what the CoPilot branch got wrong, so it isn't
retried.

### `overlayfs-lab/README.md`

Prose writeup of what the harness below exercises and what it actually showed.

---

## 6. Verification

**Static (here, now).** `sh -n` every edited script. `./check_all.sh` to confirm no project's
symlink shell broke.

**Kernel config — already verified (§4).** Nothing to change. Worth one check that the *target*
package matches the running kernel, since `/proc/config.gz` reflects what the build box
booted rather than what `${PACKAGESDIR}/rapidkernels/64/6.1.118/bzImage` contains.

**Union-semantics harness — `overlayfs-lab/union_harness.sh`.** Self-contained; it
**duplicates** the layering logic rather than sourcing `livekit.irfs.lib`, so the production
file stays free of test hooks. It builds three throwaway layers (squashfs via `mksquashfs`
when available, plain directories otherwise — overlayfs does not care which), assembles the
lowerdir string exactly as `init_union` does, mounts it, and asserts:

1. **priority order** — a file present in all three layers resolves to the highest-numbered
   one, i.e. `rl/modules` still beats `rl/base`, matching `add:1:`;
2. **whiteouts** — `rm` of a lower-only file hides it, and it returns after a fresh mount;
3. **copy-up** — editing a lower-only file leaves the lower untouched and writes to `upper/`;
4. **directory rename** — `mv` of a lower-only directory succeeds with `redirect_dir=on`
   (and fails `EXDEV` without it, which is the point of setting it);
5. **`remount,ro` then `remount,rw`** both succeed on an overlay that has an upper.

This host has `overlay` and `squashfs` in `/proc/filesystems` but no `mksquashfs`/`busybox`,
so it can run 1–5 with plain directories; run it again on a RapidLinux build box for the
squashfs path.

**Build.** On the build host with `/opt/RL/packages` present:
`export RAPIDBUILDSDIR=/path/to/RapidBuilds.claude_switch_overlayfs && cd RapidBuild64 && ./rebuild.sh bo`
— `bo` rebuilds only `baseoutput` (initramfs + ISO), the fast loop. `001-core` needs a full
`./rebuild.sh 001` to pick up the `activate`/`deactivate` removal.

**Boot.** `qemu-system-x86_64 -m 4G -cdrom <iso>`, first with `debug` appended to the kernel
cmdline — `init` already drops to a shell at each stage. Confirm in order:
`grep overlay /proc/filesystems` before the union is built; `cat /memory/lowerdirs` matches
the bundles announced; `mount | grep ' / '` shows `overlay` with the expected lowerdir list;
the system reaches a login prompt; `touch /etc/probe` works post-boot (the union is rw);
`ls /mnt/live/memory/bundles` shows every bundle still loop-mounted. Then reboot cleanly and
confirm `cleanup` unmounts everything — it matches on the `/memory/union` path rather than on
the `aufs` fstype, so it needs no change, but it is the last thing to see working.

**Boot from USB too**, not just the ISO — `find_data_try` takes a different path (no loop
ISO), and it is the only configuration where `persistent_changes` could ever engage.

---

## Out of scope

- `rl/optional/` stays unloaded at boot (your call) — it is still a manual staging area.
- No changes to `04-prep_irfs.sh`, `07-stamp_iso.sh`, `make_iso.sh`, any bootloader config,
  or any `.xzm` build script.
- `RapidBuilds.claude_switch_unionfs` and `RapidBuilds.switchaaufstounionfs` get no work.
