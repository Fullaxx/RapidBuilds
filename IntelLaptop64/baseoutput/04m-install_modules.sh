#!/bin/bash

source ../spec.sh
source ./module_spec.sh
set -e

if [ ! -d ${MODSDIR} ]; then
  echo "${MODSDIR} deos not exist!"
  exit 1
fi

# Copy any extra modules
cp -Lpv ${PACKAGESDIR}/java8/jre-8u172-x86_64-1.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/VirtualBox/VirtualBox-5.2.12${ARCH}-1.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/LibreOffice/LibreOffice-5.3.7-x86_64-2.xzm ${MODSDIR}/
