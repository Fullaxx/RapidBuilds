PROJNAME="RAPIDFS"
SLACKPKGVERS="current"
KERNVERS="4.9.80"
ARCH="x86_64"
TIMESTAMPEDISO="0"

# This is the list of categories that will be rebuilt by "./rebuild.sh all"
PROJECTCATEGORIES="1 2 3 5 9"

# Can we automate this by checking the existance of dirs?
INCMOD002UTILS="Y"
INCMOD003INTERP="Y"
INCMOD005SERVER="Y"

RAPIDBUILDSDIR="/opt/RL/RapidBuilds"
RAPIDSHELLSDIR="/opt/RL/RapidShells"
RAPIDKERNELSDIR="/opt/RL/RapidKernel"
PACKAGESDIR="/opt/RL/packages"

PROJECTBASE="${RAPIDBUILDSDIR}/RapidFileserver64"
RAPIDDEPLOGIC="${RAPIDBUILDSDIR}/RDL"
RLSHELL="${RAPIDSHELLSDIR}/RapidBuild-sr09.tar"
ISOOUTPUTDIR="/opt/RL/isos/"

if [ "$ARCH" == "x86_64" ]; then
  SLACKPKGDIR="${PACKAGESDIR}/slackware/Slack64-${SLACKPKGVERS}/slackware64"
  SLACKEXTRA="${PACKAGESDIR}/slackware/Slack64-${SLACKPKGVERS}/extra"
  KERNELPKGDIR="${RAPIDKERNELSDIR}/64/${KERNVERS}"
  LIBDIR="lib64"
else
  SLACKPKGDIR="${PACKAGESDIR}/slackware/Slack32-${SLACKPKGVERS}/slackware32"
  SLACKEXTRA="${PACKAGESDIR}/slackware/Slack32-${SLACKPKGVERS}/extra"
  KERNELPKGDIR="${RAPIDKERNELSDIR}/32/${KERNVERS}"
  LIBDIR="lib"
fi

FUNCTIONSFILE="${PROJECTBASE}/functions.sh"
if [ ! -r ${FUNCTIONSFILE} ]; then
  echo "${FUNCTIONSFILE} not found"
  exit 1
fi
source ${FUNCTIONSFILE}

kernelcheck
rootcheck
loadconfig