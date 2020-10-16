#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCDARKHTTPD}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/darkhttpd/darkhttpd-1.12-${ARCH}-bksrc1.xzm"
fi

if [ "${INCLIBMICROHTTPD}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/libmicrohttpd/libmicrohttpd-0.9.69-${ARCH}-bksrc1.xzm"
fi

if [ "${INCLIBVIRT}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/libvirt/libvirt-6.8.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCLIBWEBSOCKETS}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/libwebsockets/libwebsockets-3.1.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCMONGOCDRIVER}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/mongo/mongo-c-driver-1.15.3-${ARCH}-bksrc1.xzm"
fi

if [ "${INCNGINX}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/nginx/nginx-1.15.9-${ARCH}-bksrc1.xzm"
fi

if [ "${INCNNG}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/mbedtls/mbedtls-2.16.8-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/nng/nng-1.3.2-${ARCH}-bksrc1.xzm"
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
  linkpackage "${PACKAGESDIR}/node/node-v10.15.3-${ARCH}-1.xzm"
fi

if [ "${INCNOVNC}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/noVNC/noVNC-1.1.0-noarch-bksrc1.xzm"
fi

if [ "${INCQEMU}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/qemu/qemu-4.2.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCQUARK}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/quark/quark-20200527-${ARCH}-bksrc1.xzm"
fi

if [ "${INCREDIS}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/redis/redis-6.0.6-${ARCH}-bksrc1.xzm"
fi

if [ "${INCSPICE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/spice/spice-protocol-0.14.3-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/spice/spice-0.14.3-${ARCH}-bksrc1.xzm"
fi

if [ "${INCUSBREDIR}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/spice/usbredir-0.8.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCYAJL}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/yajl/yajl-2.1.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCZEROMQ}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/zeromq/zeromq-4.3.2-${ARCH}-bksrc2.xzm"
  linkpackage "${PACKAGESDIR}/zeromq/libpgm-5.2.122-${ARCH}-bksrc2.xzm"
  linkpackage "${PACKAGESDIR}/zeromq/czmq-4.1.1-${ARCH}-bksrc2.xzm"
  linkpackage "${PACKAGESDIR}/zeromq/jzmq-20181026-${ARCH}-bksrc1.xzm"
fi
