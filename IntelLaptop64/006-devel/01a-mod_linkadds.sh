#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCASTYLE}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/astyle/astyle-3.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCGDB}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/cgdb/cgdb-0.7.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPROTOBUF}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/protobuf/protobuf-3.5.2-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPROTOBUFC}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/protobuf/protobuf-c-1.3.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCVALGRIND}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/valgrind/valgrind-3.13.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCVALKYRIE}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/valgrind/valkyrie-2.0.0-${ARCH}-bksrc1.xzm"
fi
