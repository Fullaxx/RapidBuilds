#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up cmake, if we dont have QT5
if [ "${INCCMAKE}" == "Y" ] && [ "${INCQTSIX}" != "Y" ]; then
  rm ${DIR}/usr/bin/cmake-gui
fi
