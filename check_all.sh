#!/bin/bash

set -e

#if [ `id -u` != "0" ]; then
#  echo "Got Root?"
#  exit 1
#fi

RETVAL=0
RAPIDBUILDSDIR=`dirname $0`
if [ "${RAPIDBUILDSDIR}" == "." ]; then RAPIDBUILDSDIR=`pwd`; fi
PROJECTS="RapidBuild64 RapidInstall64 RapidFileserver64 RapidWorkstation64 RapidDocker64 VPS64 DPS64 IntelLaptop64 CudaWorkstation64 IntelWorkstation64 BareMetal64"

for PROJDIR in ${PROJECTS}; do
  for SCRLINK in `find ${RAPIDBUILDSDIR}/${PROJDIR} -type l -name "*.sh"`; do
    if [ ! -e ${SCRLINK} ]; then
      RETVAL=1
      ls -l ${SCRLINK}
    fi
  done
done

exit ${RETVAL}
