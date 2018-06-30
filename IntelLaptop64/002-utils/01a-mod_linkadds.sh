#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCACPI}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/acpi/acpi-1.7-${ARCH}-bksrc1.xzm"
fi

if [ "${INCBINDTOOLS}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/bindtools/bindtools-9.11.3-${ARCH}-4.xzm"
fi

if [ "${INCCALC}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/calc/calc-2.12.6.5-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCOLORTAIL}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/colortail/colortail-0.3.3-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCORKSCREW}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/corkscrew/corkscrew-2.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCURLFTPFS}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/curlftpfs/curlftpfs-0.9.2-${ARCH}-bksrc1.xzm"
fi

if [ "${INCEXTUNDELETE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/extundelete/extundelete-0.2.4-${ARCH}-bksrc1.xzm"
fi

if [ "${INCLOOPAESSETUP}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/loop-aes-losetup/loop-aes-losetup-2.30.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCNUMACTL}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/numactl/numactl-2.0.11-${ARCH}-bksrc1.xzm"
fi
