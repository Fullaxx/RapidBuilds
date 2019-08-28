#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up pidgin, if we dont have TCL
if [ "${INCPIDGIN}" == "Y" ] && [ "${INCTCL}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/purple-2/tcl.so
fi
