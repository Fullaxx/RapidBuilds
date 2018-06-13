#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCACPI}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/acpi/acpi-1.7-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCALC}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/calc/calc-2.12.6.5-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCOLORTAIL}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/colortail/colortail-0.3.3-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCORKSCREW}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/corkscrew/corkscrew-2.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCURLFTPFS}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/curlftpfs/curlftpfs-0.9.2-${ARCH}-bksrc1.xzm"
fi

if [ "${INCLOOPAESSETUP}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/loop-aes-losetup/loop-aes-losetup-2.30.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCNUMACTL}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/numactl/numactl-2.0.11-${ARCH}-bksrc1.xzm"
fi
