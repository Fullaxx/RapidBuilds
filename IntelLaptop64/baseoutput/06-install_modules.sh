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
  verbosecopymodule ${PACKAGESDIR}/chrome/chrome-98.0.4758.102-x86_64-1.xzm ${MODSDIR}/
fi

# LibreOffice needs RDL
if [ "${INCLIBREOFFICE}" == "Y" ]; then
  verbosecopymodule ${PACKAGESDIR}/avahi/avahi-libs-0.8-${ARCH}-bksrc1.xzm ${MODSDIR}/
  verbosecopymodule ${PACKAGESDIR}/LibreOffice/LibreOffice-7.1.6-${ARCH}-1.xzm ${MODSDIR}/
fi

# VSCode needs RDL
if [ "${INCVSCODE}" == "Y" ]; then
  verbosecopymodule ${PACKAGESDIR}/vscode/vscode-1.64.2-${ARCH}-1.xzm ${MODSDIR}/
fi

# Copy any extra modules that don't need RDL
verbosecopymodule ${PACKAGESDIR}/VirtualBox/VirtualBox-6.1.32-x86_64-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/chromium/chromium-98.0.4758.80-${ARCH}-1alien.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/dbwalls/dbwalls-1920-130207.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/docker/docker-19.03.15-${ARCH}-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/veracrypt/veracrypt-console-1.25.9-${ARCH}-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/vivaldi/vivaldi-5.1.2567.66-${ARCH}-1.xzm ${MODSDIR}/
