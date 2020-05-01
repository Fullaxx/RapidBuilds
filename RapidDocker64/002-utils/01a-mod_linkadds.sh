#!/bin/bash

source ../spec.sh
source ./module_spec.sh

linkpackage ${SLACKPKGDIR}/n/dnsmasq-*.txz

linkpackage ${PACKAGESDIR}/atop/atop-2.3.0-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/ioping/ioping-1.1-${ARCH}-bksrc1.xzm
linkpackage ${PACKAGESDIR}/iotop/iotop-20181016-${ARCH}-bksrc1.xzm
