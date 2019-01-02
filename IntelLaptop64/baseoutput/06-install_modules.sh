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
  verbosecopymodule ${PACKAGESDIR}/chrome/chrome-70.0.3538.110-x86_64-1.xzm ${MODSDIR}/
fi

# VSCode needs RDL
if [ "${INCVSCODE}" == "Y" ]; then
  verbosecopymodule ${PACKAGESDIR}/vscode/vscode-1.29.1-${ARCH}-1.xzm ${MODSDIR}/
fi

# Copy any extra modules that don't need RDL
verbosecopymodule ${PACKAGESDIR}/VirtualBox/VirtualBox-5.2.22-${ARCH}-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/LibreOffice/LibreOffice-5.4.7-${ARCH}-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/chromium/chromium-69.0.3497.100-${ARCH}-1alien.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/dbwalls/dbwalls-1920-130207.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/docker/docker-18.09.0-${ARCH}-3.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/docker-compose/docker-compose-1.23.2-${ARCH}-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/java8/jre-8u181-${ARCH}-4.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/veracrypt/veracrypt-console-1.23-${ARCH}-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/vivaldi/vivaldi-stable-2.1.1337.36-1.${ARCH}.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/vivaldi-codecs-ffmpeg-extra/vivaldi-codecs-ffmpeg-extra-69.0.3497.81-${ARCH}-1.xzm ${MODSDIR}/
