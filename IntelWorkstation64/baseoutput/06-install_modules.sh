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

# Chrome needs RDL
if [ "${INCCHROME}" == "Y" ]; then
  verbosecopymodule ${PACKAGESDIR}/chrome/chrome-87.0.4280.141-x86_64-1.xzm ${MODSDIR}/
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
# verbosecopymodule ${PACKAGESDIR}/cutter/cutter-1.8.0-x86_64-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/dbwalls/dbwalls-1920-130207.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/docker/docker-19.03.14-${ARCH}-1.xzm ${MODSDIR}/
# verbosecopymodule ${PACKAGESDIR}/hyper/hyper-2.1.2-x86_64-1.xzm ${MODSDIR}/
# verbosecopymodule ${PACKAGESDIR}/idea/ideaIU-2018.2.4-noarch-1.xzm ${MODSDIR}/
# verbosecopymodule ${PACKAGESDIR}/java8/jdkdocs-8u191-noarch-1.xzm ${MODSDIR}/
# verbosecopymodule ${PACKAGESDIR}/java8/jdk-8u191-${ARCH}-1.xzm ${MODSDIR}/
# verbosecopymodule ${PACKAGESDIR}/maven/maven-3.6.3-noarch-1.xzm ${MODSDIR}/
# verbosecopymodule ${PACKAGESDIR}/netbeans/netbeans-8.2.0.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/vivaldi/vivaldi-3.5.2115.87-${ARCH}-1.xzm ${MODSDIR}/

# Desktop Configuration
verbosecopymodule ${PACKAGESDIR}/rapidconfigs/rapidconfig-rapidworkstation-20200914-noarch-1.xzm ${MODSDIR}/
