#!/bin/bash
#
# union_harness.sh - prove the overlayfs union semantics RapidLinux relies on
#
# This is deliberately SELF-CONTAINED. It does not source livekit.irfs.lib and
# must never be made to: the production initramfs library stays free of test
# hooks, and this file duplicates the handful of lines of layering logic on
# purpose so it can run anywhere without dragging the boot path along with it.
# Every duplicated fragment is marked "DUPLICATED FROM". If the initramfs
# changes, change the copy here to match - that is the deal.
#
# Usage:  ./union_harness.sh [workdir]
#
# Group A (logic)  needs nothing but a shell. Always runs.
# Group B (kernel) needs root and CAP_SYS_ADMIN to mount. Skipped with a clear
#                  message where mounting is not permitted, e.g. inside an
#                  unprivileged container.
#
# Author: Brett Kuskie <fullaxx@gmail.com>
#

set -u

WORK="${1:-}"
OWNDIR=""
PASS=0; FAIL=0; SKIP=0
MOUNTS=""

head2() { echo; echo "== $* =="; }
say()   { echo "       $*"; }
ok()    { PASS=$((PASS+1)); echo "  PASS  $*"; }
bad()   { FAIL=$((FAIL+1)); echo "  FAIL  $*"; }
skip()  { SKIP=$((SKIP+1)); echo "  SKIP  $*"; }

check() { # check <description> <expected> <actual>
  if [ "$2" = "$3" ]; then ok "$1"; else bad "$1 (expected '$2', got '$3')"; fi
}

domount() { # domount <args...> <mountpoint>
  local MP
  eval MP=\"\${$#}\"
  if mount "$@" 2>/dev/null; then MOUNTS="$MP
$MOUNTS"; return 0; fi
  return 1
}

doumount() {
  umount "$1" 2>/dev/null
  MOUNTS="$(printf '%s\n' "$MOUNTS" | grep -vxF "$1")"
}

cleanup() {
  local M
  printf '%s\n' "$MOUNTS" | while read -r M; do
    [ -n "$M" ] && umount "$M" 2>/dev/null
  done
  [ -n "$OWNDIR" ] && [ -d "$WORK" ] && rm -rf "$WORK"
  return 0
}
trap cleanup EXIT

# ------------------------------------------------------------- preflight
if [ -z "$WORK" ]; then WORK="$(mktemp -d)"; OWNDIR=1; fi
mkdir -p "$WORK" || exit 1

HAVE_OVERLAY=0; grep -qw overlay /proc/filesystems && HAVE_OVERLAY=1
HAVE_SQUASHFS=0
command -v mksquashfs >/dev/null 2>&1 && grep -qw squashfs /proc/filesystems && HAVE_SQUASHFS=1

# Can we mount at all? Cheapest possible probe.
CAN_MOUNT=0
if [ "$(id -u)" = "0" ]; then
  _P="$WORK/.mountprobe"; mkdir -p "$_P"
  if mount -t tmpfs tmpfs "$_P" 2>/dev/null; then CAN_MOUNT=1; umount "$_P"; fi
  rmdir "$_P" 2>/dev/null
fi

echo "union_harness  kernel=$(uname -r)  overlayfs=$HAVE_OVERLAY  squashfs=$HAVE_SQUASHFS  can_mount=$CAN_MOUNT"
echo "work=$WORK"

# =========================================================================
# GROUP A - pure logic, no privileges required
# =========================================================================

head2 "A1: sortmod orders bundles ascending by basename"
# DUPLICATED FROM livekit.irfs.lib sortmod()
sortmod() { cat - | sed -r "s,(.*/(.*)),\\2:\\1," | sort -n | cut -d : -f 2-; }
ORDER="$(printf '%s\n' \
  "base/100-extra.xzm" "base/001-core.xzm" "base/020-man.xzm" \
  | sortmod | tr '\n' ' ')"
check "ascending numeric order" "base/001-core.xzm base/020-man.xzm base/100-extra.xzm " "$ORDER"

head2 "A2: lowerdir list is built in reverse of discovery order"
# aufs pushed each bundle on with add:1:, so the LAST one found won. overlayfs
# reads lowerdir= highest-priority-first, so the list must come out reversed.
# DUPLICATED FROM livekit.irfs.lib init_union()
LOWER=""
for DIR in /memory/bundles/001-core.xzm /memory/bundles/020-man.xzm /memory/bundles/100-extra.xzm; do
  if [ "$DIR" != "" ]; then LOWER="$DIR${LOWER:+:$LOWER}"; fi
done
say "discovery : 001-core 020-man 100-extra   (base first, then modules)"
say "lowerdir= : $(echo "$LOWER" | tr ':' '\n' | xargs -n1 basename | tr '\n' ' ')"
check "last found is leftmost (highest priority)"  "100-extra.xzm" "$(basename "${LOWER%%:*}")"
check "first found is rightmost (lowest priority)" "001-core.xzm"  "$(basename "${LOWER##*:}")"

head2 "A3: bundle names that would corrupt the option string are rejected"
# DUPLICATED FROM livekit.irfs.lib mount_bundles()
guard() { case "$1" in *[,:\\]*) return 1 ;; *) return 0 ;; esac; }
for N in 001-core.xzm 020-man.xzm curlftpfs-0.9.2-x86_64-bksrc1.xzm; do
  if guard "/memory/bundles/$N"; then ok "accepts $N"; else bad "wrongly rejects $N"; fi
done
for N in 'a,b.xzm' 'a:b.xzm' 'a\b.xzm'; do
  if guard "/memory/bundles/$N"; then bad "wrongly accepts $N"; else ok "rejects $N"; fi
done

head2 "A4: option string stays inside one page"
# mount(2) copies its data argument into a single page, so the whole option
# string must stay under 4096 bytes. init_union() caps lowerdir= at 3800.
for COUNT in 12 50 140; do
  L=""
  for I in $(seq 1 $COUNT); do
    D="/memory/bundles/$(printf '%03d' $I)-module.xzm"
    L="$D${L:+:$L}"
  done
  if [ ${#L} -lt 3800 ]; then R="fits"; else R="over cap"; fi
  say "$(printf '%3d' $COUNT) bundles -> ${#L} bytes  ($R)"
done
L=""; for I in $(seq 1 12); do L="/memory/bundles/$(printf '%03d' $I)-module.xzm${L:+:$L}"; done
check "a realistic 12-bundle build is inside the cap" "fits" \
      "$([ ${#L} -lt 3800 ] && echo fits || echo 'over cap')"

# =========================================================================
# GROUP B - real mounts
# =========================================================================

if [ "$CAN_MOUNT" != "1" ] || [ "$HAVE_OVERLAY" != "1" ]; then
  head2 "B: kernel behaviour tests"
  if [ "$(id -u)" != "0" ]; then
    skip "not root - rerun as root to exercise the kernel"
  elif [ "$HAVE_OVERLAY" != "1" ]; then
    skip "no overlayfs in this kernel"
  else
    skip "mount(2) is not permitted here (no CAP_SYS_ADMIN - unprivileged container?)"
  fi
  say "Run this on a RapidLinux build box to cover B1-B5."
  echo
  echo "================================================"
  echo " passed: $PASS   failed: $FAIL   skipped: $SKIP"
  echo "================================================"
  [ "$FAIL" = "0" ]; exit $?
fi

# ---------------------------------------------------- build three layers
# Reset any state from a previous run. This matters when a workdir was passed
# on the command line and is being reused: a stale upperdir would still hold
# B2's whiteout, and B1 would then fail for no visible reason.
rm -rf "$WORK/changes" "$WORK/fresh" "$WORK/nordir" "$WORK/src" 2>/dev/null

BUNDLES="$WORK/bundles"; SRC="$WORK/src"; mkdir -p "$BUNDLES"
for L in 001-core 020-man 100-extra; do
  mkdir -p "$SRC/$L/etc" "$SRC/$L/usr/bin"
  echo "$L" > "$SRC/$L/etc/marker"          # in all three: priority test
  echo "$L" > "$SRC/$L/usr/bin/from-$L"     # unique: merge test
done
mkdir -p "$SRC/001-core/etc/onlylower"      # lower-only dir: rename test
echo original > "$SRC/001-core/etc/onlylower/file"
echo original > "$SRC/001-core/etc/lonefile" # lower-only file: whiteout test

LAYERS=""
for L in 001-core 020-man 100-extra; do
  if [ "$HAVE_SQUASHFS" = "1" ]; then
    mksquashfs "$SRC/$L" "$WORK/$L.xzm" -comp xz -b 512K -no-progress >/dev/null 2>&1
    mkdir -p "$BUNDLES/$L.xzm"
    domount -o loop -t squashfs "$WORK/$L.xzm" "$BUNDLES/$L.xzm" \
      || { echo "  FAIL  squashfs mount of $L"; exit 1; }
    LAYERS="$LAYERS $BUNDLES/$L.xzm"
  else
    LAYERS="$LAYERS $SRC/$L"
  fi
done
LOWER=""
for DIR in $LAYERS; do LOWER="$DIR${LOWER:+:$LOWER}"; done

UPPER="$WORK/changes/upper"; OWORK="$WORK/changes/work"; UNION="$WORK/union"
mkdir -p "$UPPER" "$OWORK" "$UNION"
OPTS="lowerdir=$LOWER,upperdir=$UPPER,workdir=$OWORK,xino=auto,redirect_dir=on"

head2 "B1: layer priority - rl/modules must still beat rl/base"
if ! domount -t overlay -o "$OPTS" overlay "$UNION"; then
  bad "could not mount the overlay"; echo; exit 1
fi
check "highest-numbered layer wins" "100-extra" "$(cat "$UNION/etc/marker")"
check "all three layers are merged" "3" "$(ls "$UNION/usr/bin" | wc -l)"

head2 "B2: whiteouts"
rm -f "$UNION/etc/lonefile"
check "lower-only file hidden after rm" "gone" \
      "$([ -e "$UNION/etc/lonefile" ] && echo present || echo gone)"
doumount "$UNION"
mkdir -p "$WORK/fresh/upper" "$WORK/fresh/work"
domount -t overlay -o "lowerdir=$LOWER,upperdir=$WORK/fresh/upper,workdir=$WORK/fresh/work,xino=auto,redirect_dir=on" overlay "$UNION"
check "file returns under a fresh upper" "present" \
      "$([ -e "$UNION/etc/lonefile" ] && echo present || echo gone)"
doumount "$UNION"
domount -t overlay -o "$OPTS" overlay "$UNION"
check "whiteout persists in the original upper" "gone" \
      "$([ -e "$UNION/etc/lonefile" ] && echo present || echo gone)"

head2 "B3: copy-up leaves the lower layer untouched"
echo modified > "$UNION/etc/marker"
LAST="$(echo $LAYERS | awk '{print $NF}')"
check "union shows the new content" "modified"  "$(cat "$UNION/etc/marker")"
check "copy landed in upperdir"     "modified"  "$(cat "$UPPER/etc/marker" 2>/dev/null)"
check "lower layer unchanged"       "100-extra" "$(cat "$LAST/etc/marker")"

head2 "B4: directory rename - what redirect_dir=on buys"
if mv "$UNION/etc/onlylower" "$UNION/etc/renamed" 2>/dev/null; then
  ok "mv of a lower-only directory succeeds with redirect_dir=on"
  check "renamed directory keeps contents" "original" "$(cat "$UNION/etc/renamed/file" 2>/dev/null)"
else
  bad "mv of a lower-only directory failed even with redirect_dir=on"
fi
doumount "$UNION"
mkdir -p "$WORK/nordir/upper" "$WORK/nordir/work"
domount -t overlay -o "lowerdir=$LOWER,upperdir=$WORK/nordir/upper,workdir=$WORK/nordir/work,redirect_dir=off" overlay "$UNION"
if mv "$UNION/etc/onlylower" "$UNION/etc/renamed" 2>/dev/null; then
  bad "rename also succeeded with redirect_dir=off - option may be a no-op here"
else
  ok "same rename fails with redirect_dir=off, so the option is load-bearing"
fi
doumount "$UNION"
domount -t overlay -o "$OPTS" overlay "$UNION"

head2 "B5: remount ro then rw - change_root does the first, rc.S the second"
if mount -n -o remount,ro "$UNION" 2>/dev/null; then ok "remount,ro"; else bad "remount,ro"; fi
if mount -n -o remount,rw "$UNION" 2>/dev/null; then ok "remount,rw"; else bad "remount,rw"; fi

head2 "B6: what the real mount looks like"
grep " $UNION " /proc/mounts | sed 's/^/       /'

echo
echo "================================================"
echo " passed: $PASS   failed: $FAIL   skipped: $SKIP"
echo "================================================"
[ "$FAIL" = "0" ]
