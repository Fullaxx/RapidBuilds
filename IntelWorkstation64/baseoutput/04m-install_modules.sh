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
  cp -Lpv ${PACKAGESDIR}/chrome/chrome-69.0.3497.100-x86_64-1.xzm ${MODSDIR}/
fi

# VSCode needs RDL
if [ "${INCVSCODE}" == "Y" ]; then
  cp -Lpv ${PACKAGESDIR}/vscode/vscode-1536736541-${ARCH}-1.xzm ${MODSDIR}/
fi

# Copy any extra modules that don't need RDL
cp -Lpv ${PACKAGESDIR}/VirtualBox/VirtualBox-5.2.18-${ARCH}-1.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/LibreOffice/LibreOffice-5.4.7-${ARCH}-1.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/dbwalls/dbwalls-1920-130207.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/idea/ideaIU-2018.2.4-noarch-1.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/java8/jdkdocs-8u181-noarch-1.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/java8/jdk-8u181-${ARCH}-4.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/maven/maven-3.5.4-noarch-1.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/netbeans/netbeans-9.0-noarch-1.xzm ${MODSDIR}/
