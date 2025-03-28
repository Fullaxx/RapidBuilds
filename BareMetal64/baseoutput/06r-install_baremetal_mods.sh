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
verbosecopymodule ${PACKAGESDIR}/picdrv/000b-picdrv-3.9.9.88-${KERNVERS}-x86_64-bksrc1.xzm ${BASEDIR}/

# Dektec kernel module
verbosecopymodule ${PACKAGESDIR}/dektec/000c-dektec-2025.01.0-${KERNVERS}-x86_64-bksrc1.xzm ${BASEDIR}/

# dddvb kernel module
verbosecopymodule ${PACKAGESDIR}/dddvb/000d-dddvb-20250206-${KERNVERS}-x86_64-bksrc1.xzm ${BASEDIR}/

# Docker Images
verbosecopymodule ${PACKAGESDIR}/dimgs/netdata-1.47.5.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/dimgs/portainer-2.21.5.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/dimgs/samba-241027.xzm ${MODSDIR}/
#verbosecopymodule ${PACKAGESDIR}/dimgs/dockly-230517.xzm ${MODSDIR}/
