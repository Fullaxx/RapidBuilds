#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# libsvn_auth_kwallet,cmake-gui needs QT
if [ "$INCQT" != "Y" ]; then
  rm -f ${DIR}/usr/${LIBDIR}/libsvn_auth_kwallet-?.*
  rm -f ${DIR}/usr/bin/cmake-gui
fi
