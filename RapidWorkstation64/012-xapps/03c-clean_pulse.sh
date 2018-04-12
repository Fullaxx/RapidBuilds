#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up pulse, if we dont have GCONF
if [ "${INCPULSE}" == "Y" -a "${INCGCONF}" != "Y" ]; then
  rm ${DIR}/usr/libexec/pulse/gconf-helper
fi
