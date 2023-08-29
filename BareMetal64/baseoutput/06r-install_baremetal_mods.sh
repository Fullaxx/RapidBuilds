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
verbosecopymodule ${PACKAGESDIR}/picdrv/000a-picdrv-3.9.8.56-${KERNVERS}-x86_64-bksrc1.xzm ${BASEDIR}/

# Dektec kernel module
verbosecopymodule ${PACKAGESDIR}/dektec/000a-dektec-2023.06.0-${KERNVERS}-x86_64-bksrc1.xzm ${BASEDIR}/

# dddvb kernel module
verbosecopymodule ${PACKAGESDIR}/dddvb/000a-dddvb-20230823-${KERNVERS}-x86_64-bksrc1.xzm ${BASEDIR}/

# Docker Images
verbosecopymodule ${PACKAGESDIR}/dimgs/netdata-1.42.2.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/dimgs/portainer-2.18.4.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/dimgs/dockly-230517.xzm ${MODSDIR}/
