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

# ICE kernel module
verbosecopymodule ${PACKAGESDIR}/picdrv/000b-picdrv-3.9.8.56-${KERNVERS}-x86_64-bksrc1.xzm ${BASEDIR}/

# Dektec kernel module
verbosecopymodule ${PACKAGESDIR}/dektec/000c-dektec-2023.06.0-${KERNVERS}-x86_64-bksrc1.xzm ${BASEDIR}/

# dddvb kernel module
verbosecopymodule ${PACKAGESDIR}/dddvb/000d-dddvb-20230909-${KERNVERS}-x86_64-bksrc1.xzm ${BASEDIR}/

# Docker Images
verbosecopymodule ${PACKAGESDIR}/dimgs/netdata-1.44.3.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/dimgs/portainer-2.19.4.xzm ${MODSDIR}/
#verbosecopymodule ${PACKAGESDIR}/dimgs/dockly-230517.xzm ${MODSDIR}/
