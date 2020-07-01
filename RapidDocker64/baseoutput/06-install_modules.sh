#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ ! -d ${MODSDIR} ]; then
  echo "${MODSDIR} deos not exist!"
  exit 1
fi

verbosecopymodule ${PACKAGESDIR}/docker/docker-19.03.12-${ARCH}-1.xzm ${MODSDIR}/

### export ENABLE_NVIDIA_FOR_DOCKER="1" for nvidia-container-runtime support ###
if [ "${ENABLE_NVIDIA_FOR_DOCKER}" == "1" ]; then
#  verbosecopymodule ${PACKAGESDIR}/nvidia_driver/011-nvidia-440.82-${KERNVERS}.xzm ${BASEDIR}/
  verbosecopymodule ${PACKAGESDIR}/nvidia_driver/000a-nvmods-440.82-4.14.175.xzm ${BASEDIR}/
  verbosecopymodule ${PACKAGESDIR}/libseccomp/libseccomp-2.4.3-${ARCH}-bksrc1.xzm ${MODSDIR}/
  verbosecopymodule ${PACKAGESDIR}/nvidia-container-runtime/libnvidia-container-1.0.5-${ARCH}-1.xzm ${MODSDIR}/
  verbosecopymodule ${PACKAGESDIR}/nvidia-container-runtime/libgo-14-${ARCH}.xzm ${MODSDIR}/
  verbosecopymodule ${PACKAGESDIR}/nvidia-container-runtime/nvidia-container-runtime-3.1.4-${ARCH}-bksrc1.xzm ${MODSDIR}/
  verbosecopymodule ${PACKAGESDIR}/nvidia-container-runtime/nvidia-container-toolkit-3.1.4-${ARCH}-bksrc1.xzm ${MODSDIR}/
fi
