#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up libproxy, if we dont have network-manager
if [ "${INCLIBPROXY}" == "Y" ] && [ "$INCNETWORKMANAGER" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/libproxy/*/modules/network_networkmanager.so
fi
