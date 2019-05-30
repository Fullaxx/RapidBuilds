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
  verbosecopymodule ${PACKAGESDIR}/chrome/chrome-74.0.3729.169-x86_64-1.xzm ${MODSDIR}/
fi

# VSCode needs RDL
if [ "${INCVSCODE}" == "Y" ]; then
  verbosecopymodule ${PACKAGESDIR}/vscode/vscode-1.33.1-${ARCH}-1.xzm ${MODSDIR}/
fi

# Copy any extra modules that don't need RDL
verbosecopymodule ${PACKAGESDIR}/VirtualBox/VirtualBox-5.2.30-${ARCH}-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/LibreOffice/LibreOffice-5.4.7-${ARCH}-1.xzm ${MODSDIR}/
# verbosecopymodule ${PACKAGESDIR}/archipelago/archipelago-3.2.1-x86_64-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/chromium/chromium-74.0.3729.169-${ARCH}-1alien.xzm ${MODSDIR}/
# verbosecopymodule ${PACKAGESDIR}/cutter/cutter-1.8.0-x86_64-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/dbwalls/dbwalls-1920-130207.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/docker/docker-18.09.6-${ARCH}-1.xzm ${MODSDIR}/
# verbosecopymodule ${PACKAGESDIR}/hyper/hyper-2.1.2-x86_64-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/java8/jre-8u191-${ARCH}-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/veracrypt/veracrypt-console-1.23-${ARCH}-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/vivaldi/vivaldi-stable-2.5.1525.48-1.${ARCH}.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/vivaldi-codecs-ffmpeg-extra/vivaldi-codecs-ffmpeg-extra-73.0.3683.86-${ARCH}-1.xzm ${MODSDIR}/
