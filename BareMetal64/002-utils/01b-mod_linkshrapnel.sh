#!/bin/bash

source ../spec.sh
source ./module_spec.sh

linkpackage ${PACKAGESDIR}/dive/dive-0.11.0-${ARCH}-1.xzm
linkpackage ${PACKAGESDIR}/nvtop/nvtop-3.0.2-x86_64-1.xzm
linkpackage ${PACKAGESDIR}/strace_standalone/strace-240325.xzm

# tshark needs libsmi
linkpackage ${PACKAGESDIR}/libsmi/libsmi-0.5.0-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/wireshark/tshark-4.2.10-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/termshark/termshark-2.4.0-${ARCH}-1.xzm
