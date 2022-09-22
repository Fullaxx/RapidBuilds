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

verbosecopymodule ${PACKAGESDIR}/nvidia_driver/${KERNVERS}/011-nvidia-515.76-${KERNVERS}.xzm ${BASEDIR}/

# Chrome needs RDL
if [ "${INCCHROME}" == "Y" ]; then
  verbosecopymodule ${PACKAGESDIR}/chrome/chrome-105.0.5195.102-x86_64-1.xzm ${MODSDIR}/
fi

# LibreOffice needs RDL
if [ "${INCLIBREOFFICE}" == "Y" ]; then
  verbosecopymodule ${PACKAGESDIR}/avahi/avahi-libs-0.8-${ARCH}-bksrc1.xzm ${MODSDIR}/
  verbosecopymodule ${PACKAGESDIR}/LibreOffice/LibreOffice-7.3.6-${ARCH}-1.xzm ${MODSDIR}/
fi

# VSCode needs RDL
if [ "${INCVSCODE}" == "Y" ]; then
  verbosecopymodule ${PACKAGESDIR}/vscode/vscode-1.71.2-${ARCH}-1.xzm ${MODSDIR}/
fi

# Copy any extra modules that don't need RDL
verbosecopymodule ${PACKAGESDIR}/VirtualBox/VirtualBox-6.1.38-x86_64-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/dbwalls/dbwalls-1920-220325.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/dbwalls/dbwalls-2160-170805.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/docker/docker-20.10.18-${ARCH}-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/veracrypt/veracrypt-console-1.25.9-${ARCH}-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/vivaldi/vivaldi-5.1.2567.66-${ARCH}-1.xzm ${MODSDIR}/

# Desktop Configuration
verbosecopymodule ${PACKAGESDIR}/rapidconfigs/rapidconfig-rapidworkstation-20211114-noarch-1.xzm ${MODSDIR}/

# Multicast Xfer
verbosecopymodule ${PACKAGESDIR}/mcast_xfer/mcastxfer-20220709-x86_64-bksrc1.xzm ${MODSDIR}/
