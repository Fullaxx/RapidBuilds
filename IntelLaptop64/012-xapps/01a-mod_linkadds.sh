#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCBLUEFISH}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/bluefish/bluefish-1.0.7-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCHROME}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/chrome/chrome-latest-${ARCH}.xzm"
fi

if [ "${INCETERM}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/Eterm/Eterm-0.9.6-x86_64-bksrc1.xzm"
  linkmodule "${PACKAGESDIR}/Eterm/libast-0.7-x86_64-bksrc1.xzm"
fi

if [ "${INCIMLIBTWO}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/Eterm/imlib2-1.5.1-x86_64-bksrc1.xzm"
fi

if [ "${INCVERACRYPTGUI}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/veracrypt/veracrypt-gui-latest-${ARCH}.xzm"
fi

if [ "${INCVIVALDI}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/vivaldi/vivaldi-latest-${ARCH}.xzm"
fi
