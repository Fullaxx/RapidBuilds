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

verbosecopymodule ${PACKAGESDIR}/nvidia_driver/${KERNVERS}/011-nvidia-550.144.03-${KERNVERS}.xzm ${BASEDIR}/

# Chrome needs RDL
if [ "${INCCHROME}" == "Y" ]; then
  verbosecopymodule ${PACKAGESDIR}/chrome/chrome-138.0.7204.183-x86_64-1.xzm ${MODSDIR}/
fi

# LibreOffice needs RDL
if [ "${INCLIBREOFFICE}" == "Y" ]; then
  verbosecopymodule ${PACKAGESDIR}/avahi/avahi-libs-0.8-${ARCH}-bksrc1.xzm ${MODSDIR}/
  verbosecopymodule ${PACKAGESDIR}/LibreOffice/LibreOffice-7.6.7-${ARCH}-1.xzm ${MODSDIR}/
fi

# VSCode needs RDL
if [ "${INCVSCODE}" == "Y" ]; then
  verbosecopymodule ${PACKAGESDIR}/vscode/vscode-1.97.2-${ARCH}-1.xzm ${MODSDIR}/
fi

# Copy any extra modules that don't need RDL
verbosecopymodule ${PACKAGESDIR}/VirtualBox/VirtualBox-7.1.12-x86_64-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/dbwalls/dbwalls-1920-221014.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/dbwalls/dbwalls-2160-170805.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/docker/docker-27.3.1-${ARCH}-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/mcast_xfer/mcastxfer-20230607-${ARCH}-bksrc1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/sublimetext/sublime_text-4143-${ARCH}-bksrc1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/vivaldi/vivaldi-7.2.3621.67-${ARCH}-1.xzm ${MODSDIR}/

# Desktop Configuration
verbosecopymodule ${PACKAGESDIR}/rapidconfigs/rapidconfig-rapidworkstation-20240515-noarch-1.xzm ${MODSDIR}/
