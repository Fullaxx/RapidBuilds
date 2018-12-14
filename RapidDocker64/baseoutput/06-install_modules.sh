#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ ! -d ${MODSDIR} ]; then
  echo "${MODSDIR} deos not exist!"
  exit 1
fi

cp -Lpv ${PACKAGESDIR}/docker/docker-18.09.0-${ARCH}-1.xzm ${MODSDIR}/
cp -Lpv ${PACKAGESDIR}/docker-compose/docker-compose-1.23.2-${ARCH}-1.xzm ${MODSDIR}/
