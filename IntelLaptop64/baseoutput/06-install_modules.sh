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
  verbosecopymodule ${PACKAGESDIR}/chrome/chrome-88.0.4324.182-x86_64-1.xzm ${MODSDIR}/
fi

# VSCode needs RDL
if [ "${INCVSCODE}" == "Y" ]; then
  verbosecopymodule ${PACKAGESDIR}/vscode/vscode-1.52.1-${ARCH}-1.xzm ${MODSDIR}/
fi

# LibreOffice needs avahi-libs
verbosecopymodule ${PACKAGESDIR}/avahi/avahi-libs-0.8-${ARCH}-bksrc1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/LibreOffice/LibreOffice-6.4.7-${ARCH}-1.xzm ${MODSDIR}/

# Copy any extra modules that don't need RDL
verbosecopymodule ${PACKAGESDIR}/VirtualBox/VirtualBox-6.1.18-x86_64-1.xzm ${MODSDIR}/
# verbosecopymodule ${PACKAGESDIR}/archipelago/archipelago-3.2.1-x86_64-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/chromium/chromium-86.0.4240.183-${ARCH}-1alien.xzm ${MODSDIR}/
# verbosecopymodule ${PACKAGESDIR}/cutter/cutter-1.8.0-x86_64-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/dbwalls/dbwalls-1920-130207.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/docker/docker-19.03.15-${ARCH}-1.xzm ${MODSDIR}/
# verbosecopymodule ${PACKAGESDIR}/hyper/hyper-2.1.2-x86_64-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/java8/jre-8u191-${ARCH}-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/veracrypt/veracrypt-console-1.24.7-${ARCH}-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/vivaldi/vivaldi-3.7.2218.52-${ARCH}-1.xzm ${MODSDIR}/
