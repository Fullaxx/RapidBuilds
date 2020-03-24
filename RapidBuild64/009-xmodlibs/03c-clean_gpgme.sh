#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up gpgme, if we dont have Qt5
if [ "${INCGPGME}" == "Y" ] && [ "${INCQTFIVE}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/libqgpgme.*
fi
