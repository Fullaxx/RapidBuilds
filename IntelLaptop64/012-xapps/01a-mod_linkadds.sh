#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCBLUEFISH}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/bluefish/bluefish-1.0.7-${ARCH}-bksrc1.xzm"
fi

if [ "${INCBLUEFISHTWO}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/bluefish/bluefish-2.2.7-${ARCH}-bksrc1.xzm"
fi

if [ "${INCETERM}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/Eterm/Eterm-0.9.6-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/Eterm/libast-0.7-${ARCH}-bksrc1.xzm"
fi

if [ "${INCFBPANEL}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/fbpanel/fbpanel-6.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCGEANY}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/geany/geany-1.33-${ARCH}-bksrc1.xzm"
fi

if [ "${INCHSETROOT}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/hsetroot/hsetroot-1.0.2-${ARCH}-bksrc1.xzm"
fi

if [ "${INCIMLIBTWO}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/Eterm/imlib2-1.5.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCOPENBOX}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/openbox/openbox-3.6.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCOBCONF}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/openbox/obconf-2.0.4-${ARCH}-bksrc1.xzm"
fi

if [ "${INCXFE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/xfe/xfe-1.42-${ARCH}-bksrc1.xzm"
fi

if [ "${INCFOX}" == "Y" ]; then
# XFE needs FOX
  linkpackage "${PACKAGESDIR}/fox/fox-1.6.57-${ARCH}-bksrc1.xzm"
fi
