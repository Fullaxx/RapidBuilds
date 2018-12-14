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

DOCKERTAG="fullaxx/rapidbuild64" \
${RAPIDBUILDSDIR}/RapidBuild64/rebuild.sh all

DOCKERTAG="fullaxx/rapidfileserver64" \
${RAPIDBUILDSDIR}/RapidFileserver64/rebuild.sh all

DOCKERTAG="fullaxx/rapidworkstation64" \
${RAPIDBUILDSDIR}/RapidWorkstation64/rebuild.sh all

DOCKERTAG="fullaxx/vps64" \
${RAPIDBUILDSDIR}/VPS64/rebuild.sh all

DOCKERTAG="fullaxx/dps64" \
${RAPIDBUILDSDIR}/DPS64/rebuild.sh all

# DOCKERTAG="fullaxx/intellaptop64" \
${RAPIDBUILDSDIR}/IntelLaptop64/rebuild.sh all

${RAPIDBUILDSDIR}/CudaWorkstation64/rebuild.sh all

${RAPIDBUILDSDIR}/IntelWorkstation64/rebuild.sh all
