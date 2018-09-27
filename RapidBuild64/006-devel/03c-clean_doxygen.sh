#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up doxygen if we dont have QT
if [ "${INCDOXYGEN}" == "Y" -a "${INCQT}" != "Y" ]; then
  rm ${DIR}/usr/bin/doxywizard
fi
