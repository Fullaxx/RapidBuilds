#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up libproxy
if [ "${INCLIBPROXY}" == "Y" -a "$INCNETWORKMANAGER" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/libproxy/*/modules/network_networkmanager.so
fi
