#!/bin/bash

source ../spec.sh
source ./module_spec.sh

linkpackage ${PACKAGESDIR}/calc/calc-2.14.0.14-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/colortail/colortail-0.3.3-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/curl-loader/curl-loader-0.56-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/darkhttpd/darkhttpd-1.12-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/iperf/iperf-2.0.12-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/iperf/iperf-3.6-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/ipmitool/ipmitool-20181113-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/loop-aes-losetup/loop-aes-losetup-2.30.1-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/nbd/nbd-3.24-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/numactl/numactl-2.0.11-${ARCH}-bksrc1.xzm

# tshark needs libsmi
linkpackage ${PACKAGESDIR}/wireshark/tshark-3.4.16-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/libsmi/libsmi-0.5.0-${ARCH}-bksrc1.xzm

# mosh needs protobuf
linkpackage ${PACKAGESDIR}/protobuf/protobuf-3.19.4-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/mosh/mosh-1.3.2-${ARCH}-bksrc1.xzm
