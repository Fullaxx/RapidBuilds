#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Everyone gets this
linkpackage "${PACKAGESDIR}/staticlibs/staticlibs-openssl-1.1.1g-${ARCH}-bksrc1.xzm"
linkpackage "${PACKAGESDIR}/staticlibs/staticlibs-libevent-2.1.12-${ARCH}-bksrc1.xzm"
linkpackage "${PACKAGESDIR}/staticlibs/staticlibs-libgcrypt-1.8.6-${ARCH}-bksrc1.xzm"
linkpackage "${PACKAGESDIR}/staticlibs/staticlibs-libsodium-1.0.18-${ARCH}-bksrc1.xzm"
linkpackage "${PACKAGESDIR}/staticlibs/staticlibs-libpcap-1.9.1-${ARCH}-bksrc1.xzm"
linkpackage "${PACKAGESDIR}/libnet/libnet-20220330-${ARCH}-bksrc1.xzm"

if [ "${INCASTYLE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/astyle/astyle-3.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCGDB}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/cgdb/cgdb-20210310-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCODEEXAMPLES}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/codex/bootstrap-dht-20181113-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/bstrlib-20181112-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/cJSON-20181112-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/chorddhash-20181114-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/jnr-ffi-20181114-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/jshackle-20181114-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/jsmn-20181112-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/jsonh-20181112-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/libLCTHW-20181112-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/libbtdht-20181113-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/libutp-20181113-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/microjson-20181112-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/nodeplusc-20181128-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/pdjson-20181112-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/poco-20181113-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/tiny-json-20181112-noarch-bksrc1.xzm"

  linkpackage "${PACKAGESDIR}/codex/libtomcrypt-20181114-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/libtomfloat-20181113-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/libtommath-20181114-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/libtompoly-20181113-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/tomsfastmath-20181113-noarch-bksrc1.xzm"

  linkpackage "${PACKAGESDIR}/codex/csrp-20190108-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/csrp-rfc5054-20190108-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/csrp-gmp-20190108-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/mbedtls-csrp-dwimberger-20190819-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/mbedtls-csrp-damv-20190819-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/mbedtls-csrp-dunkelstern-20190819-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/mbedtls-csrp-sdrsdr-20190819-noarch-bksrc1.xzm"

  linkpackage "${PACKAGESDIR}/codex/lz4-20190110-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/miniz-20190110-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/zlib-20190110-noarch-bksrc1.xzm"

  linkpackage "${PACKAGESDIR}/codex/CyoEncode-code-20190124-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/artemkin-z85-code-20190124-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/dcurrie-ascii85-code-20190124-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/hyperfusion-ascii85-code-20190124-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/judsonx-base85-20190124-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/k6l2-z85-code-20190124-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/rafagafe-base85-code-20190124-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/roukaour-ascii85-code-20190124-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/ssiatras-ascii85-code-20190124-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/tsvetkov-z85-code-20190124-noarch-bksrc1.xzm"

  linkpackage "${PACKAGESDIR}/codex/jedis-20190403-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/lettuce-core-20190403-noarch-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/codex/redisson-20190403-noarch-bksrc1.xzm"
fi

if [ "${INCQLIBC}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/qlibc/qlibc-2.4.5-${ARCH}-bksrc1.xzm"
fi

if [ "${INCVALGRIND}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/valgrind/valgrind-3.13.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCVALKYRIE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/valgrind/valkyrie-2.0.0-${ARCH}-bksrc1.xzm"
fi
