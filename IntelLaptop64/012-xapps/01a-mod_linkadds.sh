#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCBLUEFISH}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/bluefish/bluefish-1.0.7-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCHROME}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/chrome/chrome-latest-${ARCH}.xzm"
fi

if [ "${INCVERACRYPTGUI}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/veracrypt/veracrypt-gui-latest-${ARCH}.xzm"
fi

if [ "${INCVIVALDI}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/vivaldi/vivaldi-latest-${ARCH}.xzm"
fi
