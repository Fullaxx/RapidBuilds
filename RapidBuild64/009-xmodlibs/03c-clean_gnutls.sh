#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up gnutls
# if [ "${INCGNUTLS}" == "Y" ]; then - doesnt exist yet
  if [ "${INCGUILE}" != "Y" ]; then
    rm -r ${DIR}/usr/${LIBDIR}/guile ${DIR}/usr/share/guile
  fi
# fi
