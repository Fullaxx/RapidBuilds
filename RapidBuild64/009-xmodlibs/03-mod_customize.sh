#!/bin/bash

source ../spec.sh
source ./module_spec.sh

NMPLUG="${DIR}/usr/${LIBDIR}/libproxy/*/modules/network_networkmanager.so"
if [ -e ${NMPLUG} ]; then
  if [ "$INCNETWORKMANAGER" != "Y" ]; then
    rm ${NMPLUG}
  fi
fi

# Clean up PinEntry
if [ "${INCPINENTRY}" == "Y" ]; then
  rm -f ${DIR}/usr/bin/pinentry-gnome3
  if [ "$INCQT" != "Y" ]; then
    rm -f ${DIR}/usr/bin/pinentry-qt
    rm -f ${DIR}/usr/bin/pinentry-qt4
  fi
fi
