#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCBLUEFISH}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/bluefish/bluefish-1.0.7-${ARCH}-bksrc1.xzm"
fi

if [ "${INCETERM}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/Eterm/Eterm-0.9.6-${ARCH}-bksrc1.xzm"
  linkmodule "${PACKAGESDIR}/Eterm/libast-0.7-${ARCH}-bksrc1.xzm"
fi

if [ "${INCGEANY}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/geany/geany-1.33-${ARCH}-bksrc1.xzm"
fi

if [ "${INCIMLIBTWO}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/Eterm/imlib2-1.5.1-${ARCH}-bksrc1.xzm"
fi
