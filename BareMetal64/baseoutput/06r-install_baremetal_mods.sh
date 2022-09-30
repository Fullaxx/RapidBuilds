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
verbosecopymodule ${PACKAGESDIR}/picdrv/000a-picdrv-3.9.8.56-${KERNVERS}.xzm ${BASEDIR}/

# Dektec kernel module
verbosecopymodule ${PACKAGESDIR}/dektec/dektec-2022.06.0-${KERNVERS}.xzm ${BASEDIR}/
