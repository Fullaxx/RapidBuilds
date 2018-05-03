#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCCHROME}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/chrome/chrome-latest-${ARCH}.xzm"
fi

if [ "${INCVERACRYPTGUI}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/veracrypt/veracrypt-gui-latest-${ARCH}.xzm"
fi

if [ "${INCVIVALDI}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/vivaldi/vivaldi-latest-${ARCH}.xzm"
fi
