#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up libinput
LIBINPUTFILE="${DIR}/usr/libexec/libinput/libinput-debug-gui"
if [ -f ${LIBINPUTFILE} -a "${INCGTKTHREE}" != "Y" ]; then
  rm ${LIBINPUTFILE}
fi
