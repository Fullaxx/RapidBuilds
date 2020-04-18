#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ ! -d ${MODSDIR} ]; then
  echo "${MODSDIR} deos not exist!"
  exit 1
fi

verbosecopymodule ${PACKAGESDIR}/docker/docker-19.03.8-${ARCH}-1.xzm ${MODSDIR}/

### export ENABLE_NVIDIA_FOR_DOCKER="1" for nvidia-container-runtime support ###
if [ "${ENABLE_NVIDIA_FOR_DOCKER}" == "1" ]; then
  verbosecopymodule ${PACKAGESDIR}/nvidia_driver/011-nvidia-440.64-${KERNVERS}.xzm ${BASEDIR}/
  verbosecopymodule ${PACKAGESDIR}/libseccomp/libseccomp-2.4.3-${ARCH}-bksrc1.xzm ${MODSDIR}/
  verbosecopymodule ${PACKAGESDIR}/nvidia-container-runtime/nvidia-container-runtime-3.1.4-${ARCH}-1.xzm ${MODSDIR}/
fi
