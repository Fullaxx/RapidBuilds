#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up libpoppler, if we dont have QT4
#if [ "${INCPOPPLER}" == "Y" ] && [ "${INCQT}" != "Y" ]; then
#  rm ${DIR}/usr/${LIBDIR}/libpoppler-qt4*
#fi

# Clean up libpoppler, if we dont have QT5
if [ "${INCPOPPLER}" == "Y" ] && [ "${INCQTFIVE}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/libpoppler-qt5*
fi
