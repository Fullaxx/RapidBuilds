BUILDBASE="/tmp/${PROJNAME}"
BDIR="${BUILDBASE}/output"
BOOTDIR="${BDIR}/shell/boot"
RLDIR="${BDIR}/shell/rl"
BASEDIR="${BDIR}/shell/rl/base"
MODSDIR="${BDIR}/shell/rl/modules"
IRFSDIR="${BDIR}/irfs"
BBMOD="${PACKAGESDIR}/busybox/busybox-1.29.3-x86_64-bksrc1.xzm"

# Set this here as a default...
# If you want to choose, unset this line
RLUEFIBOOT="GRUB"
