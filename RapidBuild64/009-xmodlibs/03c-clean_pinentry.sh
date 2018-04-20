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
  if [ "${INCQT}" != "Y" ]; then
    rm ${DIR}/usr/bin/pinentry-qt
    rm ${DIR}/usr/bin/pinentry-qt4
  fi
fi
