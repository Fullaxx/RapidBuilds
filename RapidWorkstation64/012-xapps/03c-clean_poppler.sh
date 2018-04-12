#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up libpoppler, if we dont have QT
if [ "${INCPOPPLER}" == "Y" -a "${INCQT}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/libpoppler-qt4*
fi
