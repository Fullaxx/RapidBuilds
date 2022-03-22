#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f *.txz *.xzm

linkpackage ${SLACKPKGDIR}/n/iw-*.txz
linkpackage ${SLACKPKGDIR}/n/wireless_tools-*.txz

if [ "${INCBLUETOOTH}" == "Y" ]; then
  for PKG in ${SLACKPKGDIR}/n/bluez-*.txz; do linkpackage ${PKG}; done
fi

if [ "${INCCRDA}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/crda-*.txz
fi

if [ "${INCIPWFIRMWARE}" == "Y" ]; then
  for PKG in ${SLACKPKGDIR}/n/ipw*.txz; do linkpackage ${PKG}; done
fi

if [ "${INCWPASUPPLICANT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/wpa_supplicant-*.txz
fi

if [ "${INCZDFIRMWARE}" == "Y" ]; then
  for PKG in ${SLACKPKGDIR}/n/zd*.txz; do linkpackage ${PKG}; done
fi
