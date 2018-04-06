#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# wpa_gui needs QT
if [ "$INCQT" != "Y" ]; then
  rm -f ${DIR}/usr/bin/wpa_gui
fi

# obexd needs libical
rm -f ${DIR}/usr/libexec/bluetooth/obexd
