#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCASTYLE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/astyle/astyle-3.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCGDB}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/cgdb/cgdb-0.7.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCVALGRIND}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/valgrind/valgrind-3.13.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCVALKYRIE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/valgrind/valkyrie-2.0.0-${ARCH}-bksrc1.xzm"
fi
