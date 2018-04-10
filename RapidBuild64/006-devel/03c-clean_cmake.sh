#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up cmake if we dont have QT
if [ "${INCCMAKE}" == "Y" -a "${INCQT}" != "Y" ]; then
  rm ${DIR}/usr/bin/cmake-gui
fi
