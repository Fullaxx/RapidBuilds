#!/bin/bash

source ../spec.sh
source ./module_spec.sh
#CHROMEVERS="latest"

if [ ! -d ${MODSDIR} ]; then
  echo "${MODSDIR} deos not exist!"
  exit 1
fi

# Chrome needs RDL
if [ "${INCCHROME}" == "Y" ]; then
  cp -Lpv ${PACKAGESDIR}/chrome/chrome-69.0.3497.100-x86_64-1.xzm ${MODSDIR}/
fi

# VSCode needs RDL
if [ "${INCVSCODE}" == "Y" ]; then
  cp -Lpv ${PACKAGESDIR}/vscode/vscode-1539281657-${ARCH}-1.xzm ${MODSDIR}/
fi

# Copy any extra modules that don't need RDL
cp -Lpv ${PACKAGESDIR}/VirtualBox/VirtualBox-5.2.22-${ARCH}-1.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/LibreOffice/LibreOffice-5.4.7-${ARCH}-1.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/chromium/chromium-69.0.3497.100-${ARCH}-1alien.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/dbwalls/dbwalls-1920-130207.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/docker/docker-18.06.1-ce-${ARCH}-4.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/docker-compose/docker-compose-1.23.1-${ARCH}-1.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/java8/jre-8u181-${ARCH}-4.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/veracrypt/veracrypt-console-1.23-${ARCH}-1.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/vivaldi/vivaldi-stable-2.1.1337.36-1.${ARCH}.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/vivaldi-codecs-ffmpeg-extra/vivaldi-codecs-ffmpeg-extra-69.0.3497.81-${ARCH}-1.xzm ${MODSDIR}/
