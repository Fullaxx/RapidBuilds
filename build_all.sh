#!/bin/bash

set -e

if [ `id -u` != "0" ]; then
  echo "Got Root?"
  exit 1
fi

RAPIDBUILDSDIR=`dirname $0`

${RAPIDBUILDSDIR}/RapidBuild64/rebuild.sh all
${RAPIDBUILDSDIR}/RapidInstall64/rebuild.sh all
${RAPIDBUILDSDIR}/RapidFileserver64/rebuild.sh all
${RAPIDBUILDSDIR}/RapidWorkstation64/rebuild.sh all