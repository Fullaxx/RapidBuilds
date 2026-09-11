# overlayfs lab

Scratch space for proving the union behaviour that the RapidLinux initramfs depends on.

## Where you are

| | |
|---|---|
| Repo | `RapidBuilds`, branch **`claude_switch_overlayfs`** |
| Change | the live-CD union filesystem moved from aufs to overlayfs, September 2026 |
| State | **uncommitted** — the maintainer commits by hand |

Read these first if you are picking this up cold, both in
`RapidBuild64/baseoutput/RLBFILES/irfs/`:

- **`INITRAMFS.md`** — complete engineering reference for the initramfs. Boot flow, memory
  layout, the union model, every boot parameter, how to debug a failed boot, kernel
  requirements. §5 covers the union and §8 covers debugging.
- **`AUFS-TO-OVERLAYFS.md`** — why the change was made, what it cost, **and a Status section
  listing exactly what is still outstanding.** That is the file that tells you what to do
  next; this one only covers the harness.

And beside this file:

- **`PLAN.md`** — the implementation plan as approved, before any code was written, kept
  verbatim so the reasoning travels with the work. Historical, not current truth; its header
  lists the three places where reality diverged from it.

Nothing in this directory ships. `04-prep_irfs.sh` installs four named files into the image
and ignores everything else, this directory is not under `RLBFILES/` at all, and
`projects.list` is an explicit list of twelve project names so no build glob reaches it.

## Why it duplicates production code instead of sourcing it

`union_harness.sh` re-implements the three fragments of `livekit.irfs.lib` that it tests —
`sortmod()`, the `lowerdir=` reversal loop in `init_union()`, and the character guard in
`mount_bundles()`. That is deliberate, not laziness.

Sourcing `livekit.irfs.lib` from a test would mean the boot path has to tolerate being
loaded outside an initramfs: no `/proc/cmdline` worth reading, no busybox applets, `fatal()`
dropping into a shell that has no tty. The library would slowly grow "are we under test"
branches, and the one file that absolutely must not surprise anyone at boot would become the
file with the most conditionals in it. A copy of six lines is cheaper.

The cost is that the copy can drift. Each duplicated fragment is marked
`# DUPLICATED FROM <function>` so a `grep DUPLICATED` finds them all when the initramfs
changes. **If you change `init_union()` or `mount_bundles()`, update the copies here.**

## Prerequisites

| For | Needs |
|---|---|
| Group A | a POSIX shell. Nothing else. |
| Group B | root **and** `CAP_SYS_ADMIN` (it mounts things), and `CONFIG_OVERLAY_FS` in the running kernel |
| Group B, squashfs path | `mksquashfs` (`squashfs-tools`) and `CONFIG_SQUASHFS`. Without it the layers are plain directories, which still exercises every assertion — overlayfs does not care what a lower layer sits on |

The script prints what it found on its first line, so you never have to guess:

```
union_harness  kernel=6.1.118  overlayfs=1  squashfs=1  can_mount=1
```

`can_mount` is decided by actually trying to mount a tmpfs, not by looking at the uid, so it
is honest inside containers.

## Running it

```sh
./union_harness.sh            # work in a fresh mktemp dir, cleaned up on exit
./union_harness.sh /var/tmp/ovl   # or somewhere you choose, left in place
```

Exit status is 0 only if nothing failed. Skips do not fail the run.

A workdir given on the command line is reused safely — Group B resets its own state first,
so a stale upper layer from a previous run cannot leak a whiteout into the next one.

## What it checks

**Group A — logic.** No privileges, runs anywhere.

| | |
|---|---|
| A1 | `sortmod` orders bundles ascending by basename |
| A2 | the `lowerdir=` list comes out **reversed** relative to discovery order |
| A3 | bundle names containing `,` `:` or `\` are rejected |
| A4 | the assembled option string stays inside `mount(2)`'s one-page limit |

A2 is the one that earns the file. aufs's `remount,add:1:` gave the *last* bundle the highest
priority; overlayfs `lowerdir=a:b:c` gives it to the *leftmost*. Get it backwards and
everything still boots — `rl/modules` just silently stops overriding `rl/base`.

**Group B — kernel.** Builds three layers named like a real layout (`001-core`, `020-man`,
`100-extra`) and mounts them exactly as `init_union()` does.

| | |
|---|---|
| B1 | layer priority: highest-numbered wins, all three merged |
| B2 | whiteouts: `rm` hides a lower-only file, it returns under a fresh upper, the whiteout persists in the original upper |
| B3 | copy-up: union shows the new content, `upperdir` holds the copy, the lower layer is untouched |
| B4 | `mv` of a lower-only directory succeeds with `redirect_dir=on` — **plus a negative control** that the same rename fails with `redirect_dir=off`, proving the option is load-bearing rather than a no-op |
| B5 | `remount,ro` then `remount,rw` both succeed — what `change_root` does, then what Slackware `rc.S` does |
| B6 | prints the real `/proc/mounts` line for the union |

## Expected output

**A full, healthy run is 23 passed, 0 failed, 0 skipped** — 10 from Group A, 13 from Group B.

Anywhere mounting is unavailable you get **10 passed, 0 failed, 1 skipped**, with the reason
named. That is a correct result, not a partial one; the script refuses to imply Group B
succeeded when it never ran.

## If something fails

| Failure | What it means |
|---|---|
| A2 `last found is leftmost` | The reversal in `init_union()` was lost. `rl/modules` will stop overriding `rl/base` — highest-severity bug in this change. |
| A3 `wrongly accepts a,b.xzm` | The `case` guard in `mount_bundles()` was broken or dropped. A bundle name with `,`/`:` will corrupt the mount option string. |
| A4 `over cap` | Only if the test's own synthetic numbers moved. Real builds are nowhere near. |
| B1 `highest-numbered layer wins` | Same class as A2 but proven against the kernel — the assembled `lowerdir=` is in the wrong order. |
| B2 any | Whiteouts are not working. Almost always the upper filesystem: check `CONFIG_TMPFS_XATTR` and see `dmesg`. |
| B3 `lower layer unchanged` | Something is writing through to a lower layer. Should be impossible; check the mount really has an `upperdir`. |
| B4 `failed even with redirect_dir=on` | `redirect_dir` is not taking effect — usually no `trusted.*` xattr support on the upper. `INITRAMFS.md` §10. |
| B4 `also succeeded with redirect_dir=off` | Not a bug in RapidLinux; the kernel was built with `CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y` and a lower-only dir happened to be copied up already. Worth a look but not a blocker. |
| B5 `remount,ro` | `change_root` would warn and carry on, so this is not fatal, but investigate — it is unexpected on a union that has an upper layer. |
| `could not mount the overlay` | Read `dmesg`. Almost always the upper: unsupported filesystem, or missing xattr support. |

## Results so far

Dev box, 2026-09-11, kernel 6.8.0-124-generic:

```
union_harness  kernel=6.8.0-124-generic  overlayfs=1  squashfs=0  can_mount=0

  PASS  ascending numeric order
  PASS  last found is leftmost (highest priority)
  PASS  first found is rightmost (lowest priority)
  PASS  accepts 001-core.xzm / 020-man.xzm / curlftpfs-0.9.2-x86_64-bksrc1.xzm
  PASS  rejects a,b.xzm / a:b.xzm / a\b.xzm
  PASS  a realistic 12-bundle build is inside the cap
  SKIP  mount(2) is not permitted here (no CAP_SYS_ADMIN - unprivileged container?)

 passed: 10   failed: 0   skipped: 1
```

**Group A: 10/10.**

**A4 produced a number worth keeping.** Bundle count against the size of the `lowerdir=`
string, at realistic `/memory/bundles/NNN-module.xzm` path lengths:

| bundles | `lowerdir=` bytes | |
|---|---|---|
| 10 | 329 | the actual RapidBuild64 set, ~8% of budget |
| 12 | 371 | synthetic |
| 50 | 1549 | fine |
| 140 | 4339 | over the cap |

So the practical ceiling is a bit over 100 bundles against ~10 today. `init_union()` fails
the boot with a clear message at 3800 bytes rather than letting the kernel truncate the
option string silently. The other ceiling is `CONFIG_BLK_DEV_LOOP_MIN_COUNT=255`.

**Group B has never been run.** The dev container has no `CAP_SYS_ADMIN` — not even in its
bounding set, so even `mount -t tmpfs` is refused — and no `mksquashfs`. Run it as root on a
RapidLinux build box, which has both:

```sh
sudo ./union_harness.sh
```

Expect 23 passed. Then continue with the build and boot steps in
`../RapidBuild64/baseoutput/RLBFILES/irfs/AUFS-TO-OVERLAYFS.md`.
