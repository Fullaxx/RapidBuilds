#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up libproxy
if [ "${INCLIBPROXY}" == "Y" ]; then
  if [ "$INCNETWORKMANAGER" != "Y" ]; then
    rm -f ${DIR}/usr/${LIBDIR}/libproxy/*/modules/network_networkmanager.so
  fi
fi

# Clean up PinEntry
if [ "${INCPINENTRY}" == "Y" ]; then
  rm -f ${DIR}/usr/bin/pinentry-gnome3
  if [ "${INCGTKTWO}" != "Y" ]; then
    rm -f ${DIR}/usr/bin/pinentry-gtk-2
  fi
  if [ "${INCQT}" != "Y" ]; then
    rm -f ${DIR}/usr/bin/pinentry-qt
    rm -f ${DIR}/usr/bin/pinentry-qt4
  fi
fi

# Clean up libsamplerate
if [ "${INCLIBSNDFILE}" != "Y" ]; then
  rm -f ${DIR}/usr/bin/sndfile-resample
fi
