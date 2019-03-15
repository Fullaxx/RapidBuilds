#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCDARKHTTPD}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/darkhttpd/darkhttpd-1.12-${ARCH}-bksrc1.xzm"
fi

if [ "${INCLIBMICROHTTPD}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/libmicrohttpd/libmicrohttpd-0.9.63-${ARCH}-bksrc1.xzm"
fi

if [ "${INCLIBVIRT}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/libvirt/libvirt-4.9.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCLIBWEBSOCKETS}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/libwebsockets/libwebsockets-3.1.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCNGINX}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/nginx/nginx-1.15.9-${ARCH}-bksrc1.xzm"
fi

if [ "${INCNNG}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/mbedtls/mbedtls-2.16.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/nng/nng-1.1.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCNODEZEROTEN}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/node/node-v0.10.48-${ARCH}-1.xzm"
fi

if [ "${INCNODEZEROTWELVE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/node/node-v0.12.18-${ARCH}-1.xzm"
fi

if [ "${INCNODEFOUR}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/node/node-v4.9.1-${ARCH}-1.xzm"
fi

if [ "${INCNODESIX}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/node/node-v6.14.4-${ARCH}-1.xzm"
fi

if [ "${INCNODEEIGHT}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/node/node-v8.12.0-${ARCH}-1.xzm"
fi

if [ "${INCNODETEN}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/node/node-v10.14.2-${ARCH}-1.xzm"
fi

if [ "${INCNOVNC}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/noVNC/noVNC-1.0.0-noarch-bksrc1.xzm"
fi

if [ "${INCREDIS}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/redis/redis-4.0.12-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/redis/webdis-20181217-${ARCH}-bksrc1.xzm"
fi

if [ "${INCQEMU}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/qemu/qemu-2.12.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCYAJL}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/yajl/yajl-2.1.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCZEROMQ}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/zeromq/zeromq-4.3.1-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/zeromq/libpgm-5.2.122-${ARCH}-bksrc2.xzm"
  linkpackage "${PACKAGESDIR}/zeromq/czmq-4.1.1-${ARCH}-bksrc2.xzm"
  linkpackage "${PACKAGESDIR}/zeromq/jzmq-20181026-${ARCH}-bksrc1.xzm"
fi
