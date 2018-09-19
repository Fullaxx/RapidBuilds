#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ ! -d ${BASEDIR} ]; then
  echo "${BASEDIR} does not exist!"
  exit 1
fi

if [ ! -d ${MODSDIR} ]; then
  echo "${MODSDIR} does not exist!"
  exit 1
fi

if [ ! -e ${PACKAGESDIR}/nvidia_driver/011-nvidia-390.77-${KERNVERS}.xzm ]; then
  echo "${PACKAGESDIR}/nvidia_driver/011-nvidia-390.77-${KERNVERS}.xzm does not exist!"
  exit 1
fi

cp -Lpv ${PACKAGESDIR}/nvidia_driver/011-nvidia-390.77-${KERNVERS}.xzm ${BASEDIR}/

# Chrome needs RDL
if [ "${INCCHROME}" == "Y" ]; then
# cp -Lpv ${PACKAGESDIR}/chrome/chrome-latest-${ARCH}.xzm ${MODSDIR}/
# cp -Lpv ${PACKAGESDIR}/chrome/chrome-67.0.3396.99-${ARCH}-1.xzm ${MODSDIR}/
  cp -Lpv ${PACKAGESDIR}/chrome/chrome-68.0.3440.106-${ARCH}-1.xzm ${MODSDIR}/
fi

# VSCode needs RDL
if [ "${INCVSCODE}" == "Y" ]; then
  cp -Lpv ${PACKAGESDIR}/vscode/vscode-1536225977-${ARCH}-1.xzm ${MODSDIR}/
fi

# Copy any extra modules that don't need RDL
cp -Lpv ${PACKAGESDIR}/VirtualBox/VirtualBox-5.2.18-${ARCH}-1.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/LibreOffice/LibreOffice-5.4.7-${ARCH}-1.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/dbwalls/dbwalls-1920-130207.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/java8/jdkdocs-8u181-noarch-1.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/java8/jdk-8u181-${ARCH}-3.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/nvidia_cuda_toolkit/cuda-9.2.148.1-${ARCH}-1.xzm ${MODSDIR}/

# cp -Lpv ${PACKAGESDIR}/chromium/chromium-64.0.3282.119-${ARCH}-1alien.xzm ${MODSDIR}/
# cp -Lpv ${PACKAGESDIR}/veracrypt/veracrypt-gui-latest-${ARCH}.xzm ${MODSDIR}/
# cp -Lpv ${PACKAGESDIR}/vivaldi/vivaldi-latest-${ARCH}.xzm ${MODSDIR}/
