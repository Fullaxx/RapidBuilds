#!/bin/bash

source ../spec.sh
source ./module_spec.sh

linkpackage ${PACKAGESDIR}/ag/ag-20230321-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/arpscan/arp-scan-1.10.0-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/axel/axel-2.17.11-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/broot/broot-1.22.1-${ARCH}-1.xzm
linkpackage ${PACKAGESDIR}/btopplusplus/btop-1.2.13-${ARCH}-1.xzm
linkpackage ${PACKAGESDIR}/calc/calc-2.14.0.14-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/ccat/ccat-1.1.0-${ARCH}-1.xzm
linkpackage ${PACKAGESDIR}/colortail/colortail-0.3.3-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/ctop/ctop-0.7.7-${ARCH}-1.xzm
linkpackage ${PACKAGESDIR}/curl-loader/curl-loader-0.56-${ARCH}-bksrc2.xzm
linkpackage ${PACKAGESDIR}/darkhttpd/darkhttpd-1.12-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/delta/delta-0.15.1-${ARCH}-1.xzm
linkpackage ${PACKAGESDIR}/dive/dive-0.11.0-${ARCH}-1.xzm
linkpackage ${PACKAGESDIR}/dry/dry-0.11.1-${ARCH}-1.xzm
linkpackage ${PACKAGESDIR}/gping/gping-1.12.0-${ARCH}-1.xzm
linkpackage ${PACKAGESDIR}/iperf/iperf-2.0.12-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/iperf/iperf-3.13-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/ipmitool/ipmitool-20230406-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/lazy/lazydocker-0.21.1-${ARCH}-1.xzm
linkpackage ${PACKAGESDIR}/lazy/lazygit-0.40.2-${ARCH}-1.xzm
linkpackage ${PACKAGESDIR}/loop-aes-losetup/loop-aes-losetup-2.30.1-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/micro/micro-2.0.11-${ARCH}-1.xzm
linkpackage ${PACKAGESDIR}/nbd/nbd-3.24-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/nbdkit/nbdkit-20240426-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/ncdu/ncdu-2.2.1-${ARCH}-1.xzm
linkpackage ${PACKAGESDIR}/nnn/nnn-4.8-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/numactl/numactl-2.0.11-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/nvtop/nvtop-3.0.2-x86_64-1.xzm
linkpackage ${PACKAGESDIR}/pv/pv-1.6.20-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/strace_standalone/strace-240325.xzm
linkpackage ${PACKAGESDIR}/wol/wol-20230330-${ARCH}-bksrc1.xzm

# bmon needs libconfuse
linkpackage ${PACKAGESDIR}/libconfuse/libconfuse-3.2.2-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/bmon/bmon-4.0-${ARCH}-bksrc1.xzm

# tshark needs libsmi
linkpackage ${PACKAGESDIR}/libsmi/libsmi-0.5.0-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/wireshark/tshark-4.2.10-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/termshark/termshark-2.4.0-${ARCH}-1.xzm
