PROJNAME="RAPIDINSTALL"
SLACKPKGVERS="current"
KERNVERS="4.9.80"
ARCH="x86_64"
TIMESTAMPEDISO="0"

# This is the list of categories that will be rebuilt by "./rebuild.sh all"
PROJECTCATEGORIES="1"

PACKAGESDIR="/opt/RL/packages"
SHELLSDIR="/opt/RL/RapidShells"
RLSHELL="${SHELLSDIR}/RapidInstall-sr09.tar"
ISOOUTPUTDIR="/opt/RL/isos/"

if [ "$ARCH" == "x86_64" ]; then
  SLACKPKGDIR="${PACKAGESDIR}/slackware/Slack64-${SLACKPKGVERS}/slackware64"
  SLACKEXTRA="${PACKAGESDIR}/slackware/Slack64-${SLACKPKGVERS}/extra"
  KERNELPKGDIR="/opt/RL/RapidKernel/64/${KERNVERS}"
  LIBDIR="lib64"
else
  SLACKPKGDIR="${PACKAGESDIR}/slackware/Slack32-${SLACKPKGVERS}/slackware32"
  SLACKEXTRA="${PACKAGESDIR}/slackware/Slack32-${SLACKPKGVERS}/extra"
  KERNELPKGDIR="/opt/RL/RapidKernel/32/${KERNVERS}"
  LIBDIR="lib"
fi

if [ ! -d ${KERNELPKGDIR} ]; then
  echo "${KERNELPKGDIR} - FIX KERNELPKGDIR in spec.sh"
  exit 1
fi

if [ -x ./rebuild.sh -a -r ./functions.sh ]; then
  source ./functions.sh
elif [ -r ../functions.sh ]; then
  source ../functions.sh
else
  echo "functions.sh not found"
  exit 1
fi

rootcheck
loadconfig
