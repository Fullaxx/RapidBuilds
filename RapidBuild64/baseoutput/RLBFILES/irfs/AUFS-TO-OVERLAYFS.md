# aufs to overlayfs

Decision record for the September 2026 switch of the RapidLinux union filesystem.
`INITRAMFS.md` describes the result; this file records why, what it cost, and what is still
outstanding.

---

## Status

**Branch `claude_switch_overlayfs`. Uncommitted** — the maintainer commits by hand.

The implementation plan as approved, with the reasoning behind each decision, is kept
verbatim at `overlayfs-lab/PLAN.md`. It is historical; this section is what is current.

Changed:

```
 M RapidBuild64/baseoutput/RLBFILES/irfs/init
 M RapidBuild64/baseoutput/RLBFILES/irfs/livekit.irfs.lib
 M RapidBuild64/001-core/RLBFILES/rootcopy/usr/lib/liblinuxlive
 M RapidBuild64/001-core/02r-rootcopy.sh
 D RapidBuild64/001-core/RLBFILES/rootcopy/usr/bin/activate
 D RapidBuild64/001-core/RLBFILES/rootcopy/usr/bin/deactivate
 A RapidBuild64/baseoutput/RLBFILES/irfs/INITRAMFS.md
 A RapidBuild64/baseoutput/RLBFILES/irfs/AUFS-TO-OVERLAYFS.md
 A overlayfs-lab/{union_harness.sh,README.md}
```

### Done

- All initramfs and `001-core` code changes, detailed under "What changed" below.
- `sh -n` and `dash -n` clean on every touched script. `./check_all.sh` passes, so no
  project's symlink shell is broken.
- `overlayfs-lab/union_harness.sh` **Group A: 10/10** — ordering reversal, `sortmod`,
  the bundle-name guard, and the option-string budget.
- The real `mount_bundles` -> `/memory/lowerdirs` -> `init_union` data flow was dry-run
  against a simulated RapidBuild64 layout with `mount` stubbed. Correct order out
  (`curlftpfs`, found last, is leftmost/highest priority; `000-kmods` rightmost), bad names
  rejected, non-`.xzm` files filtered, `upper`/`work` created. 329-byte `lowerdir=`.

### Outstanding

1. **Harness Group B, on a build box.** Never run — the dev container had no
   `CAP_SYS_ADMIN` and no `mksquashfs`. This is the first thing to do.

   ```sh
   cd overlayfs-lab && sudo ./union_harness.sh     # expect 23 passed, 0 failed
   ```

2. **Build the ISO.** Needs root and `/opt/RL/packages`.

   ```sh
   export RAPIDBUILDSDIR=/abs/path/to/RapidBuilds.claude_switch_overlayfs
   cd "$RAPIDBUILDSDIR/RapidBuild64"
   ./rebuild.sh 001     # 001-core, to pick up the activate/deactivate removal
   ./rebuild.sh bo      # baseoutput: initramfs + ISO. The fast loop on its own.
   ```

   Output lands at `${ISOOUTPUTDIR}/RAPIDBUILD.iso`, default `/opt/RL/output/RAPIDBUILD.iso`.

3. **Boot it, with `debug` on the kernel command line.** `init` drops to a shell at each of
   seven stages; `Ctrl+D` continues.

   ```sh
   qemu-system-x86_64 -m 4G -cdrom /opt/RL/output/RAPIDBUILD.iso
   ```

   At the shells, in order — the full list and a healthy reference output are in
   `INITRAMFS.md` §8:

   | Check | Expect |
   |---|---|
   | `grep -w overlay /proc/filesystems` | present, before the union is built |
   | `cat /memory/lowerdirs` | every bundle announced, lowest priority first |
   | `mount \| grep ' / '` | `overlay`, with the highest-numbered bundle **first** in `lowerdir=` |
   | reaches a login prompt | |
   | `touch /etc/probe` after boot | succeeds, so the union is rw |
   | `ls /mnt/live/memory/bundles` | every bundle still loop-mounted |
   | clean reboot | `cleanup` unmounts everything without hanging |

4. **Boot from USB too, not only the ISO.** `find_data_try` takes a different path when
   there is no loop-mounted ISO, and it is the only configuration where
   `persistent_changes` could ever engage.

5. **Separate follow-up, only after the above passes in the field:** drop the aufs patch
   series and `CONFIG_AUFS_FS` from the out-of-tree kernel build at
   `${PACKAGESDIR}/rapidkernels/64/6.1.118/`. Deliberately *not* bundled with this change —
   see "Kernel" below.

### Settled decisions — do not revisit without asking

- **`activate`/`deactivate` were deleted, not reimplemented.** The maintainer chose this
  explicitly after being shown the alternatives. See "What it cost" below.
- **`rl/optional/` is still not loaded at boot.** Also an explicit choice.
- **unionfs is out**, and the `RapidBuilds.claude_switch_unionfs` and
  `RapidBuilds.switchaaufstounionfs` directories and branches are being deleted.

---

## Why

aufs is not in mainline Linux and never has been. Every RapidLinux kernel build at
`${PACKAGESDIR}/rapidkernels/64/<version>/` had to carry the aufs patch series, which has to
be rebased against each new kernel and is a recurring source of pain. The requirement was
simply: **stop patching the kernel source**.

## Why overlayfs and not unionfs

|  | unionfs (Zadok / Stony Brook) | unionfs-fuse | **overlayfs** |
|---|---|---|---|
| In mainline? | Never merged | n/a (userspace) | Yes, since 3.18 |
| Needs a kernel patch? | **Yes** | No | **No** |
| Maintained? | No — dead since roughly 2014 | Lightly | Actively, by the VFS maintainers |
| Workable as `/`? | Yes | Poorly | Yes |
| squashfs lower layers | Yes | Yes | **Yes, unchanged** |
| Speed | Kernel | A syscall round-trip per operation | Kernel |

**unionfs** fails the requirement outright: adopting it would swap one out-of-tree patch
series for another, less maintained one. That is not progress.

**unionfs-fuse** needs no patch, but it is the wrong shape for a root filesystem. It is a
userspace daemon that would have to live inside the very filesystem it serves, `pivot_root`
onto a FUSE mount is awkward at best, and every path lookup in the running system would cost
a round trip through userspace.

**overlayfs** has been mainline since 3.18, is what Docker, podman, systemd and OSTree all
depend on, and was already compiled into the RapidLinux kernel.

**The `.xzm` format did not change and did not need to.** overlayfs accepts any directory as
a lower layer, including a loop-mounted xz-squashfs. No module was rebuilt; `dir2xzm`,
`xzm2dir`, `txz2xzm`, `deb2xzm`, `rpm2xzm` and every `mksquashfs` invocation are untouched.

## What it cost: no more on-the-fly module activation

This is the real trade and it should not be glossed over.

aufs can add and remove branches on a *mounted* union:

```sh
mount -o remount,add:1:/mnt/live/memory/images/foo.xzm aufs /    # activate
mount -t aufs -o remount,del:/mnt/live/memory/images/foo.xzm aufs /   # deactivate
```

overlayfs fixes its layer list at mount time. There is no equivalent, and there is no way to
build one. Mounting a second overlay over `/` would leak a mount per module and is capped at
one level by `FILESYSTEM_MAX_STACK_DEPTH`; modifying a lower layer under a live overlay is
explicitly undefined behaviour. Kernel 6.7's `lowerdir+=` removes the option-string length
limit but still only applies at mount time, so upgrading the kernel does not help either.

This is not a RapidLinux-specific discovery. Slax moved to overlayfs for the Debian-based 9.x
series, hit exactly this, and eventually recompiled its kernel to put aufs back — see
<https://www.slax.org/blog/25843-AUFS-is-a-must.html>.

**Decision: `activate` and `deactivate` were deleted rather than faked.** A command that
looks like it works and quietly does something different is worse than no command. What
remains:

| To do this | Use |
|---|---|
| Install a module into the running system, one-way | `xzm2dir mod.xzm /` — already what `activate`'s own error message suggested, and what `rl_xm` wraps |
| Install a module permanently | Copy it into `rl/modules/` and reboot |
| Load a module conditionally at boot | `load=` / `noload=` on the kernel command line |

`rl/optional/` remains a manual staging area; `init` still does not load it automatically.

## What changed

### `RLBFILES/irfs/livekit.irfs.lib`

| Before | After |
|---|---|
| `init_aufs()` — `modprobe aufs`, with a TODO about verifying support | `init_overlay()` — `modprobe overlay`, then `fatal` unless `overlay` is in `/proc/filesystems`. The TODO is now answered. |
| `init_union()` mounted an empty union **first**, from `$CHANGES` alone | `init_union()` runs **last**, taking a file of lower branches, and mounts once |
| `union_append_bundles()` loop-mounted each bundle and pushed it on with `remount,add:1:` | `mount_bundles()` loop-mounts each bundle and **prints its mountpoint**; it never touches the union |
| `$CHANGES` was the writable branch directly (`br=`) | `$CHANGES/upper` and `$CHANGES/work`, which overlayfs requires to be siblings on one filesystem, with `work` empty |
| posix probe: write, symlink, toggle `+x` | `overlay_upper_ok()` — `mknod`s a real whiteout on the bare directory, then mounts a throwaway overlay using it as an upper layer |
| `echo aufs / aufs defaults 0 0` | `echo overlay / overlay defaults 0 0` |
| `ln -s /bin/true sbin/fsck.aufs` | `ln -s /bin/true sbin/fsck.overlay` |
| `mount -n -o remount,ro aufs .` | `mount -n -o remount,ro overlay .`, warning instead of dying if it fails |

### `RLBFILES/irfs/init`

New `LOWERS=$MEMORY/lowerdirs`. `init_aufs` becomes `init_overlay`. The bundle mounts moved
ahead of the union:

```sh
mount_bundles "$DATA" "$BUNDLES" "base"    >  "$LOWERS"
mount_bundles "$DATA" "$BUNDLES" "modules" >> "$LOWERS"
init_union "$CHANGES" "$UNION" "$LOWERS"
```

### `RapidBuild64/001-core/`

- Deleted `RLBFILES/rootcopy/usr/bin/activate` and `.../deactivate`.
- `02r-rootcopy.sh` — dropped both from the `chmod 0700` list.
- `RLBFILES/rootcopy/usr/lib/liblinuxlive` — removed `union_insert_dir()`,
  `union_insert_module()` and `union_insert_modules()`, the only three functions carrying
  `remount,add:1:`. `fstab_update()` now writes `overlay / overlay defaults`.

  That leaves `mount_module()` and `find_n_run_scripts()` with no callers anywhere — the
  former was only used by `union_insert_module`, the latter only by `activate` and
  `deactivate`. Both are generic and harmless, so they were left alone rather than widening
  the diff; `INITRAMFS.md` §11 records them so nobody wastes time working out what calls
  them.

### Not changed, and did not need to be

`cleanup`, `rltar_pxedl.irfs.lib`, `04-prep_irfs.sh`, `07-stamp_iso.sh`, `make_iso.sh`, every
bootloader config, and every `.xzm` build script.

`cleanup` is worth calling out: it unmounts by matching the `/memory/union` *path* rather
than a filesystem type, so it survived the switch untouched. The unmount ordering it already
had — union, then loop devices, then `/memory/*` — is exactly what overlayfs needs.

## Behaviour differences to be aware of

| | aufs | overlayfs |
|---|---|---|
| Add/remove a layer at runtime | Yes | **No** |
| Directory rename out of a lower layer | Always worked | Needs `redirect_dir=on`, which we set. Without it: `EXDEV` |
| Hardlinks surviving copy-up | Broken (no `plink`) | Broken (no `index=on`). No change |
| Unique inode numbers | `xino=/.xino` | `xino=auto`. Equivalent in practice |
| Whiteout representation | `.wh.<name>` files | Character device `0:0` plus `trusted.overlay.*` xattrs |
| Writable branch requirements | Fairly relaxed | Needs `trusted.*` xattrs, valid `d_type`, char-device whiteouts; rejects vfat |

Two consequences of the last two rows:

- **Existing persistent-changes directories do not carry over.** aufs whiteouts are files,
  overlayfs whiteouts are device nodes; neither understands the other. A `changes/` directory
  written by the old initramfs will simply be ignored (the new layout nests under
  `changes/upper`). Nothing is lost, but nothing is migrated either. In practice this affects
  nobody: no shipped boot entry passes `perch`.
- **If persistent changes are ever turned on, do not change the module set underneath them.**
  `redirect_dir` and `xino` write records into the upper layer that reference lower-layer
  paths. The kernel documents offline changes to the lower tree as unsupported once those
  features have been used. aufs had a similar caveat; overlayfs is stricter about it.

## Kernel

**No rebuild was required.** The 6.1.118 kernel already had everything:

```
CONFIG_OVERLAY_FS=y
CONFIG_SQUASHFS=y  CONFIG_SQUASHFS_XZ=y
CONFIG_BLK_DEV_LOOP=y
CONFIG_TMPFS_XATTR=y
CONFIG_RD_LZMA=y
```

The `# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set` and `# CONFIG_OVERLAY_FS_XINO_AUTO is not
set` lines are Kconfig *defaults*, not availability gates — both mount options are accepted
regardless, and `init_union` passes them explicitly. See `INITRAMFS.md` §10.

`CONFIG_AUFS_FS=y` is still set, which made the migration safer than it might have been: both
filesystems live in the same kernel image, so the new ISO and the old ISO can be A/B tested
on identical hardware with an identical kernel, and rollback is just booting the old ISO.
**Dropping the aufs patch series and `CONFIG_AUFS_FS` is a separate follow-up**, to be done
once the overlayfs ISO has proven itself in the field.

## For the record: the earlier attempt

`origin/switchaufstooverlay` (commit `add353bc`, "CoPilot attempt") is a dead end and should
not be revived. It was a find-and-replace of the string `aufs` with `overlay` across three
files, which misses the three differences that actually matter:

1. **It kept the `add:1:` loop**, just renaming the filesystem in it:
   `mount -o remount,add:1:"$2/$BUN" overlay "$3"`. That option does not exist in overlayfs.
   Every bundle append failed, so the union stayed empty. The commit still contains the
   `# XXX FIXME` / `mount` / `ls -l` / `df -h` debug dump the author added while working out
   why — it was committed mid-debug and never finished.
2. **Its `init_union` ignored the `$1` changes argument** and hardcoded a throwaway
   `/memory/overlay-upper`, so everything `persistent_changes` does was discarded and `perch`
   became a silent no-op.
3. **It touched nothing outside `irfs/`**, leaving `activate`, `deactivate` and
   `liblinuxlive` still speaking aufs.

It also never addressed the ordering reversal, which is the subtle one: that bug does not
stop the system booting, it just makes `rl/modules` stop overriding `rl/base`.

## Verifying

`overlayfs-lab/union_harness.sh` covers the union semantics directly — ordering, whiteouts,
copy-up, directory rename, `remount,ro`/`rw`, and the option-string budget. See
`overlayfs-lab/README.md`. `INITRAMFS.md` §8 covers debugging a real boot.
