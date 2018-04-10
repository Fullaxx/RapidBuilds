#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up subversion if we dont have QT
if [ "${INCSUBVERSION}" == "Y" -a "${INCQT}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/libsvn_auth_kwallet-?.*
fi
