#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up subversion
if [ "${INCSUBVERSION}" == "Y" ]; then
# if we dont have QT
  if [ "${INCQT}" != "Y" ]; then
    rm ${DIR}/usr/${LIBDIR}/libsvn_auth_kwallet-?.*
  fi
fi
