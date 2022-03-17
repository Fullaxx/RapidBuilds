#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up libinput, if we dont have GTK-4
LIBINPUTFILE="${DIR}/usr/libexec/libinput/libinput-debug-gui"
if [ -f ${LIBINPUTFILE} ] && [ "${INCGTKFOUR}" != "Y" ]; then
  rm ${LIBINPUTFILE}
fi
