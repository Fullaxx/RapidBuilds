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
  verbosecopymodule ${PACKAGESDIR}/chrome/chrome-132.0.6834.159-x86_64-1.xzm ${MODSDIR}/
fi

# LibreOffice needs RDL
if [ "${INCLIBREOFFICE}" == "Y" ]; then
  verbosecopymodule ${PACKAGESDIR}/avahi/avahi-libs-0.8-${ARCH}-bksrc1.xzm ${MODSDIR}/
  verbosecopymodule ${PACKAGESDIR}/LibreOffice/LibreOffice-7.6.7-${ARCH}-1.xzm ${MODSDIR}/
fi

# VSCode needs RDL
if [ "${INCVSCODE}" == "Y" ]; then
  verbosecopymodule ${PACKAGESDIR}/vscode/vscode-1.96.4-${ARCH}-1.xzm ${MODSDIR}/
fi

# Copy any extra modules that don't need RDL
verbosecopymodule ${PACKAGESDIR}/VirtualBox/VirtualBox-7.0.22-x86_64-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/chromium/chromium-109.0.5414.119-${ARCH}-1alien.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/dbwalls/dbwalls-1920-221014.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/docker/docker-27.3.1-${ARCH}-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/mcast_xfer/mcastxfer-20230607-${ARCH}-bksrc1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/sublimetext/sublime_text-4143-${ARCH}-bksrc1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/vivaldi/vivaldi-7.1.3570.58-${ARCH}-1.xzm ${MODSDIR}/
