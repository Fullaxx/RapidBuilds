#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ ! -d ${MODSDIR} ]; then
  echo "${MODSDIR} deos not exist!"
  exit 1
fi

# Copy any extra modules that don't need RDL
cp -Lpv ${PACKAGESDIR}/VirtualBox/VirtualBox-5.2.16-${ARCH}-1.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/LibreOffice/LibreOffice-5.4.7-${ARCH}-1.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/chrome/chrome-latest-${ARCH}.xzm ${MODSDIR}/
# cp -Lpv ${PACKAGESDIR}/chromium/chromium-64.0.3282.119-${ARCH}-1alien.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/dbwalls/dbwalls-1920-130207.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/java8/jre-8u172-${ARCH}-1.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/nvidia_driver/011-nvidia-390.77-4.9.112.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/nvidia_cuda_toolkit/cuda-9.2.88.1-${ARCH}-1.xzm ${MODSDIR}/
# cp -Lpv ${PACKAGESDIR}/veracrypt/veracrypt-gui-latest-${ARCH}.xzm ${MODSDIR}/
# cp -Lpv ${PACKAGESDIR}/vivaldi/vivaldi-latest-${ARCH}.xzm ${MODSDIR}/
