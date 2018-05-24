#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f *.txz *.xzm

ln -s ${SLACKPKGDIR}/n/iw-*.txz
ln -s ${SLACKPKGDIR}/n/wireless_tools-*.txz

if [ "${INCBLUETOOTH}" == "Y" ]; then

  for PKG in ${SLACKPKGDIR}/n/bluez-*.txz; do ln -s ${PKG}; done

# BlueDevil is a set of components which integrate Bluetooth in KDE
  if [ "${INCQT}" == "Y" ]; then
    ln -s ${SLACKPKGDIR}/l/libbluedevil-*.txz
  fi

fi

if [ "${INCCRDA}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/crda-*.txz
fi

if [ "${INCIPWFIRMWARE}" == "Y" ]; then
  for PKG in ${SLACKPKGDIR}/n/ipw*.txz; do ln -s ${PKG}; done
fi

if [ "${INCWICD}" == "Y" ]; then
  linkmodule ${SLACKEXTRA}/wicd/wicd-*.txz
fi

if [ "${INCWPASUPPLICANT}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/wpa_supplicant-*.txz
fi

if [ "${INCZDFIRMWARE}" == "Y" ]; then
  for PKG in ${SLACKPKGDIR}/n/zd*.txz; do ln -s ${PKG}; done
fi
