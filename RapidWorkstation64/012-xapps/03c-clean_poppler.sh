#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up libpoppler
if [ "${INCPOPPLER}" == "Y" ]; then

if [ "${INCQTFIVE}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/libpoppler-qt5*
fi

if [ "${INCQTSIX}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/libpoppler-qt6*
fi

fi
