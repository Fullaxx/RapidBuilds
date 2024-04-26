#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up PinEntry
if [ "${INCPINENTRY}" == "Y" ]; then
  rm ${DIR}/usr/bin/pinentry-gnome3
  if [ "${INCGTKTWO}" != "Y" ]; then
    rm ${DIR}/usr/bin/pinentry-gtk-2
    rm ${DIR}/usr/bin/pinentry
    ln -s pinentry-curses ${DIR}/usr/bin/pinentry
  fi

# if we dont have QT6
  if [ "${INCQTSIX}" != "Y" ]; then
    rm ${DIR}/usr/bin/pinentry-qt
  fi

# if we dont have QT5
  if [ "${INCQTFIVE}" != "Y" ]; then
    rm ${DIR}/usr/bin/pinentry-qt5
  else
#   pinentry-qt needs libKF5WaylandClient.so from kwayland
    KWLVERS="5.98.0"
    KWLPKG="${PACKAGESDIR}/kde/kwayland-${KWLVERS}-${ARCH}-1.txz"
    if [ -f ${KWLPKG} ]; then
      ( set -e; cd ${DIR}/; tar xvf ${KWLPKG} --wildcards usr/lib64/libKF5WaylandClient.so.* )
    fi
  fi
fi
