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
  verbosecopymodule ${PACKAGESDIR}/chrome/chrome-74.0.3729.169-x86_64-1.xzm ${MODSDIR}/
fi

# VSCode needs RDL
if [ "${INCVSCODE}" == "Y" ]; then
  verbosecopymodule ${PACKAGESDIR}/vscode/vscode-1.32.3-${ARCH}-2.xzm ${MODSDIR}/
fi

# Copy any extra modules that don't need RDL
verbosecopymodule ${PACKAGESDIR}/VirtualBox/VirtualBox-5.2.26-${ARCH}-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/LibreOffice/LibreOffice-5.4.7-${ARCH}-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/archipelago/archipelago-3.2.1-x86_64-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/cutter/cutter-1.8.0-x86_64-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/dbwalls/dbwalls-1920-130207.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/docker/docker-18.09.5-${ARCH}-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/hyper/hyper-2.1.2-x86_64-1.xzm ${MODSDIR}/
# verbosecopymodule ${PACKAGESDIR}/idea/ideaIU-2018.2.4-noarch-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/java8/jdkdocs-8u191-noarch-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/java8/jdk-8u191-${ARCH}-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/maven/maven-3.5.4-noarch-2.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/netbeans/netbeans-8.2.0.xzm ${MODSDIR}/

# Desktop Configuration
verbosecopymodule ${PACKAGESDIR}/rapidconfigs/rapidconfig-rapidworkstation-20190409-noarch-1.xzm ${MODSDIR}/
