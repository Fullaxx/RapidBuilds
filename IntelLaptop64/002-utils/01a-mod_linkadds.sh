#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCCALC}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/calc/calc-2.12.6.5-${ARCH}-bksrc1.xzm"
fi
