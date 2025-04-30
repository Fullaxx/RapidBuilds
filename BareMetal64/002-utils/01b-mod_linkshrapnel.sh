#!/bin/bash

source ../spec.sh
source ./module_spec.sh

linkpackage ${PACKAGESDIR}/darkhttpd/darkhttpd-1.12-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/dive/dive-0.11.0-${ARCH}-1.xzm
linkpackage ${PACKAGESDIR}/lazy/lazydocker-0.21.1-${ARCH}-1.xzm
linkpackage ${PACKAGESDIR}/lazy/lazygit-0.40.2-${ARCH}-1.xzm
linkpackage ${PACKAGESDIR}/nvtop/nvtop-3.0.2-x86_64-1.xzm
linkpackage ${PACKAGESDIR}/strace_standalone/strace-240325.xzm

# bmon needs libconfuse
linkpackage ${PACKAGESDIR}/libconfuse/libconfuse-3.2.2-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/bmon/bmon-4.0-${ARCH}-bksrc1.xzm

# tshark needs libsmi
linkpackage ${PACKAGESDIR}/libsmi/libsmi-0.5.0-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/wireshark/tshark-4.2.10-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/termshark/termshark-2.4.0-${ARCH}-1.xzm
