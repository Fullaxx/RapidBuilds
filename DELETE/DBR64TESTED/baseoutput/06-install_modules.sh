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
  verbosecopymodule ${PACKAGESDIR}/chrome/chrome-107.0.5304.121-x86_64-1.xzm ${MODSDIR}/
fi

# LibreOffice needs RDL
if [ "${INCLIBREOFFICE}" == "Y" ]; then
  verbosecopymodule ${PACKAGESDIR}/avahi/avahi-libs-0.8-${ARCH}-bksrc1.xzm ${MODSDIR}/
  verbosecopymodule ${PACKAGESDIR}/LibreOffice/LibreOffice-7.4.7-${ARCH}-1.xzm ${MODSDIR}/
fi

# Copy any extra modules that don't need RDL
# verbosecopymodule ${PACKAGESDIR}/dbwalls/dbwalls-1920-130207.xzm ${MODSDIR}/
# verbosecopymodule ${PACKAGESDIR}/rapidconfigs/rapidconfig-rapidworkstation-20200914-noarch-1.xzm ${MODSDIR}/

# NextMidas (NextMidas package includes ICE driver package)
verbosecopymodule ${PACKAGESDIR}/java8/jdk-8u191-${ARCH}-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/NextMidas/NextMidas-220623.xzm ${MODSDIR}/