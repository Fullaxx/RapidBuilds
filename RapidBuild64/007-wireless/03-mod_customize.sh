#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# wpa_gui needs QT
if [ "${INCQTFIVE}" != "Y" ]; then
  rm ${DIR}/usr/bin/wpa_gui
fi

# obexd needs libical
rm -f ${DIR}/usr/libexec/bluetooth/obexd
