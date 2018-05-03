#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCLIBMICROHTTPD}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/libmicrohttpd/libmicrohttpd-0.9.59-${ARCH}-bksrc1.xzm"
fi

if [ "${INCREDIS}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/redis/redis-4.0.9-${ARCH}-bksrc1.xzm"
  linkmodule "${PACKAGESDIR}/redis/webdis-latest-${ARCH}.xzm"
fi
