#!/bin/bash

source ../spec.sh
source ./module_spec.sh

linkpackage ${PACKAGESDIR}/ag/ag-20230321-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/arpscan/arp-scan-1.10.0-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/axel/axel-2.17.11-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/btopplusplus/btop-1.2.13-${ARCH}-1.xzm
linkpackage ${PACKAGESDIR}/calc/calc-2.14.0.14-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/ccat/ccat-1.1.0-${ARCH}-1.xzm
linkpackage ${PACKAGESDIR}/colortail/colortail-0.3.3-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/curl-loader/curl-loader-0.56-${ARCH}-bksrc2.xzm
linkpackage ${PACKAGESDIR}/darkhttpd/darkhttpd-1.12-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/delta/delta-0.15.1-${ARCH}-1.xzm
linkpackage ${PACKAGESDIR}/iperf/iperf-2.0.12-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/iperf/iperf-3.13-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/ipmitool/ipmitool-20230406-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/loop-aes-losetup/loop-aes-losetup-2.30.1-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/nbd/nbd-3.24-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/nbdkit/nbdkit-20230322-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/numactl/numactl-2.0.11-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/pv/pv-1.6.20-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/wol/wol-20230330-${ARCH}-bksrc1.xzm

# tshark needs libsmi
linkpackage ${PACKAGESDIR}/termshark/termshark-2.4.0-${ARCH}-1.xzm
linkpackage ${PACKAGESDIR}/wireshark/tshark-3.6.12-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/libsmi/libsmi-0.5.0-${ARCH}-bksrc1.xzm

# mosh needs protobuf
linkpackage ${PACKAGESDIR}/protobuf/protobuf-3.20.3-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/mosh/mosh-1.3.2-${ARCH}-bksrc2.xzm
