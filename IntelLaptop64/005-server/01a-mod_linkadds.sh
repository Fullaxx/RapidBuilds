#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCLIBMICROHTTPD}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/libmicrohttpd/libmicrohttpd-0.9.59-${ARCH}-bksrc1.xzm"
fi

if [ "${INCLIBVIRT}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/libvirt/libvirt-4.3.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCREDIS}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/redis/redis-4.0.9-${ARCH}-bksrc1.xzm"
  linkmodule "${PACKAGESDIR}/redis/webdis-latest-${ARCH}.xzm"
fi

if [ "${INCQEMU}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/qemu/qemu-2.11.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCYAJL}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/yajl/yajl-2.1.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCZEROMQ}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/zeromq/zeromq-4.2.3-${ARCH}-bksrc1.xzm"
  linkmodule "${PACKAGESDIR}/zeromq/libpgm-5.2.122-${ARCH}-bksrc1.xzm"
  linkmodule "${PACKAGESDIR}/zeromq/czmq-4.1.1-${ARCH}-bksrc1.xzm"
fi
