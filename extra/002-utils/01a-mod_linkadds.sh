#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCACPI}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/acpi/acpi-1.7-${ARCH}-bksrc1.xzm"
fi

if [ "${INCATOP}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/atop/atop-2.3.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCBINDTOOLS}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/bindtools/bindtools-9.12.2_P1-${ARCH}-1.xzm"
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

if [ "${INCCURLLOADER}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/curl-loader/curl-loader-0.56-${ARCH}-bksrc1.xzm"
fi

if [ "${INCEXTUNDELETE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/extundelete/extundelete-0.2.4-${ARCH}-bksrc1.xzm"
fi

if [ "${INCIOPING}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/ioping/ioping-1.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCIOTOP}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/iotop/iotop-20181016-${ARCH}-bksrc1.xzm"
fi

if [ "${INCIPERFTWO}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/iperf/iperf-2.0.12-${ARCH}-bksrc1.xzm"
fi

if [ "${INCIPERFTHREE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/iperf/iperf-3.6-${ARCH}-bksrc1.xzm"
fi

if [ "${INCLOOPAESSETUP}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/loop-aes-losetup/loop-aes-losetup-2.30.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCLZFOUR}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/lz4/lz4-1.8.3-${ARCH}-bksrc1.xzm"
fi

if [ "${INCMOSH}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/mosh/mosh-1.3.2-${ARCH}-bksrc2.xzm"
fi

if [ "${INCNBD}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/nbd/nbd-3.18-${ARCH}-bksrc1.xzm"
fi

if [ "${INCNUMACTL}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/numactl/numactl-2.0.11-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPROTOBUF}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/protobuf/protobuf-3.6.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPROTOBUFC}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/protobuf/protobuf-c-1.3.1-${ARCH}-bksrc2.xzm"
fi

if [ "${INCXNBD}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/xnbd/xnbd-0.4.0-${ARCH}-bksrc1.xzm"
fi
