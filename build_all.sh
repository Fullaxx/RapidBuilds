#!/bin/bash

set -e

if [ `id -u` != "0" ]; then
  echo "Got Root?"
  exit 1
fi

RAPIDBUILDSDIR=${RAPIDBUILDSDIR:-`dirname $0`}
if [ "${RAPIDBUILDSDIR}" == "." ]; then RAPIDBUILDSDIR=`pwd`; fi

${RAPIDBUILDSDIR}/RapidInstall64/rebuild.sh all
${RAPIDBUILDSDIR}/RapidDocker64/rebuild.sh all
${RAPIDBUILDSDIR}/RapidBuild64/rebuild.sh all
${RAPIDBUILDSDIR}/RapidFileserver64/rebuild.sh all
${RAPIDBUILDSDIR}/RapidWorkstation64/rebuild.sh all

${RAPIDBUILDSDIR}/VPS64/rebuild.sh all
${RAPIDBUILDSDIR}/DPS64/rebuild.sh all
${RAPIDBUILDSDIR}/IntelLaptop64/rebuild.sh all
${RAPIDBUILDSDIR}/CudaWorkstation64/rebuild.sh all
${RAPIDBUILDSDIR}/IntelWorkstation64/rebuild.sh all
