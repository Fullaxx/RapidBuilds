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

if [ "${INCLIBMARIADB}" == "Y" -a "${INCMARIADB}" != "Y" ]; then
# libapr needs libmariadb... really??
(
  echo -n "Extracting "
  cd ${DIR}/
  tar --wildcards -xvf ${SLACKPKGDIR}/ap/mariadb-*.txz usr/${LIBDIR}/libmariadb.so.?
) || bail "Couldnt find usr/${LIBDIR}/libmariadb.so.? in mariadb-*.txz"
fi
