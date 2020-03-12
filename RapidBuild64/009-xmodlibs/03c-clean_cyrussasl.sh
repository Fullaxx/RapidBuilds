#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up cyrus-sasl
# if [ "${INCCYRUSSASL}" == "Y" ]; then - doesnt exist yet
  if [ "${INCMARIADB}" != "Y" ]; then
    rm -r ${DIR}/usr/${LIBDIR}/sasl2/libsql.*
  fi
# fi
