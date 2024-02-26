#!/bin/bash

source ../spec.sh
source ./module_spec.sh

linkpackage ${SLACKPKGDIR}/n/dnsmasq-*.txz

linkpackage ${PACKAGESDIR}/atop/atop-2.3.0-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/hpnssh/hpnssh-18.3.1-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/ioping/ioping-1.1-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/iotop/iotop-20181016-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/nload/nload-20220919-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/nmon/nmon-16m-${ARCH}-bksrc1.xzm
