#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCCALC}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/calc/calc-2.12.6.5-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCURLFTPFS}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/curlftpfs/curlftpfs-0.9.2-${ARCH}-bksrc1.xzm"
fi

if [ "${INCLOOPAESSETUP}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/loop-aes-losetup/loop-aes-losetup-2.30.1-${ARCH}-bksrc1.xzm"
fi
