#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up subversion
if [ "${INCSUBVERSION}" == "Y" ]; then
# if we dont have QT5
  if [ "${INCQTFIVE}" != "Y" ]; then
    rm ${DIR}/usr/${LIBDIR}/libsvn_auth_kwallet-?.*
  fi
fi
