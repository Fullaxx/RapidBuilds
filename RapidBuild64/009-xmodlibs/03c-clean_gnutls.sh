#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Mon Mar 6 20:18:10 UTC 2023 n/gnutls-3.8.0-x86_64-1.txz: Upgraded.
# Clean up gnutls
# if [ "${INCGNUTLS}" == "Y" ]; then - doesnt exist yet
#   if [ "${INCGUILE}" != "Y" ]; then
#     rm -r ${DIR}/usr/${LIBDIR}/guile ${DIR}/usr/share/guile
#   fi
# fi
