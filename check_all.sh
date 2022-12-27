#!/bin/bash

set -e

#if [ `id -u` != "0" ]; then
#  echo "Got Root?"
#  exit 1
#fi

RETVAL=0
RAPIDBUILDSDIR=`dirname $0`
if [ "${RAPIDBUILDSDIR}" == "." ]; then RAPIDBUILDSDIR=`pwd`; fi
PROJECTS="RapidBuild64"
PROJECTS+=" RapidInstall64"
PROJECTS+=" RapidFileserver64"
PROJECTS+=" RapidWorkstation64"
PROJECTS+=" RapidDocker64"
PROJECTS+=" VPS64"
PROJECTS+=" DPS64"
PROJECTS+=" IntelLaptop64"
PROJECTS+=" CudaWorkstation64"
PROJECTS+=" IntelWorkstation64"
PROJECTS+=" BareMetal64"
PROJECTS+=" DBR64"

for PROJDIR in ${PROJECTS}; do
  for SCRLINK in `find ${RAPIDBUILDSDIR}/${PROJDIR} -type l -name "*.sh"`; do
    if [ ! -e ${SCRLINK} ]; then
      RETVAL=1
      ls -l ${SCRLINK}
    fi
  done
done

exit ${RETVAL}
