#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ ! -d ${MODSDIR} ]; then
  echo "${MODSDIR} deos not exist!"
  exit 1
fi

verbosecopymodule ${PACKAGESDIR}/docker/docker-27.3.1-${ARCH}-1.xzm ${MODSDIR}/
verbosecopymodule ${PACKAGESDIR}/vim-tiny/vim-tiny-20240918-${ARCH}-bksrc1.xzm ${MODSDIR}/

### export ENABLE_NVIDIA_FOR_DOCKER="1" for nvidia-container-runtime support ###
if [ "${ENABLE_NVIDIA_FOR_DOCKER}" == "1" ]; then
  verbosecopymodule ${PACKAGESDIR}/nvidia_driver/${KERNVERS}/000a-nvmods-550.144.03-${KERNVERS}.xzm ${BASEDIR}/
  verbosecopymodule ${PACKAGESDIR}/nvidia-container-runtime/libnvidia-container-1.9.0-${ARCH}-1.xzm ${MODSDIR}/
  verbosecopymodule ${PACKAGESDIR}/nvidia-container-runtime/nvidia-container-toolkit-1.9.0-${ARCH}-bksrc1.xzm ${MODSDIR}/
  verbosecopymodule ${PACKAGESDIR}/nvidia-container-runtime/libgo-19-${ARCH}.xzm ${MODSDIR}/
fi

# Multicast Xfer
verbosecopymodule ${PACKAGESDIR}/mcast_xfer/mcastxfer-20230607-x86_64-bksrc1.xzm ${MODSDIR}/
