set -e

PROJNAME="INTELWORKSTATION"
SLACKPKGVERS="current"
KERNVERS="6.1.118"
ARCH="x86_64"
TIMESTAMPEDISO="0"

# This is the list of categories that will be rebuilt by "./rebuild.sh all"
PROJECTCATEGORIES="001 002 003 005 006 007 009 010 012 030"

# Can we automate this by checking the existance of dirs?
INCMOD002UTILS="Y"
INCMOD003INTERP="Y"
INCMOD005SERVER="Y"
INCMOD006DEVEL="Y"
INCMOD007WIRELESS="Y"
INCMOD010XORG="Y"
INCMOD012XAPPS="Y"
INCMOD030MULTILIB="Y"

PACKAGESDIR=${PACKAGESDIR:-/opt/RL/packages}
ISOOUTPUTDIR=${ISOOUTPUTDIR:-/opt/RL/output}

if [ -z "${RAPIDBUILDSDIR}" ]; then
  >&2 echo "RAPIDBUILDSDIR is not set"
  exit 1
fi

PROJECTBASE="${RAPIDBUILDSDIR}/IntelWorkstation64"
RAPIDDEPLOGIC="${RAPIDBUILDSDIR}/RDL"
RLSHELL="${PACKAGESDIR}/rapidshells/RapidLinuxShell-230327.tar.xz"

if [ "${ARCH}" == "x86_64" ]; then
  SLACKPKGDIR="${PACKAGESDIR}/slackware/Slack64-${SLACKPKGVERS}/slackware64"
  SLACKEXTRA="${PACKAGESDIR}/slackware/Slack64-${SLACKPKGVERS}/extra"
  KERNELPKGDIR="${PACKAGESDIR}/rapidkernels/64/${KERNVERS}"
  LIBDIR="lib64"
else
  SLACKPKGDIR="${PACKAGESDIR}/slackware/Slack32-${SLACKPKGVERS}/slackware"
  SLACKEXTRA="${PACKAGESDIR}/slackware/Slack32-${SLACKPKGVERS}/extra"
  KERNELPKGDIR="${PACKAGESDIR}/rapidkernels/32/${KERNVERS}"
  LIBDIR="lib"
fi

FUNCTIONSFILE="${PROJECTBASE}/functions.sh"
if [ ! -r ${FUNCTIONSFILE} ]; then
  echo "${FUNCTIONSFILE} not found"
  exit 1
fi
source ${FUNCTIONSFILE}

loadconfig
