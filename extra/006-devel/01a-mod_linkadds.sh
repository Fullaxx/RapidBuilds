#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCASTYLE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/astyle/astyle-3.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCGDB}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/cgdb/cgdb-0.7.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCODEEXAMPLES}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/bootstrap-dht/bootstrap-dht-20181113-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/bstrlib/bstrlib-20181112-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/cJSON/cJSON-20181112-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/jsmn/jsmn-20181112-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/jsonh/jsonh-20181112-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/libLCTHW/libLCTHW-20181112-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/libbtdht/libbtdht-20181113-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/libutp/libutp-20181113-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/microjson/microjson-20181112-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/pdjson/pdjson-20181112-noarch-bksrc1.xzm"
#  linkpackage "${PACKAGESDIR}/poco/poco-20181113-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/tiny-json/tiny-json-20181112-noarch-bksrc1.xzm"

  linkpackage "${PACKAGESDIR}/libtom/libtomcrypt-20181113-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/libtom/libtomfloat-20181113-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/libtom/libtommath-20181113-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/libtom/libtompoly-20181113-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/libtom/tomsfastmath-20181113-noarch-bksrc1.xzm"
fi

if [ "${INCVALGRIND}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/valgrind/valgrind-3.13.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCVALKYRIE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/valgrind/valkyrie-2.0.0-${ARCH}-bksrc1.xzm"
fi
