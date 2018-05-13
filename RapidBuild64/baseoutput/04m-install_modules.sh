#!/bin/bash

source ../spec.sh
source ./module_spec.sh
set -e

if [ ! -d ${MODSDIR} ]; then
  echo "${MODSDIR} deos not exist!"
  exit 1
fi

# Copy any extra modules
cp -Lpv ${PACKAGESDIR}/curlftpfs/curlftpfs-0.9.2-${ARCH}-bksrc1.xzm ${MODSDIR}/
