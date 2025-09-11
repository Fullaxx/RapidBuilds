#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# clean up sqlite, if we don't have tcl
if [ -f ${DIR}/usr/bin/sqlite3_analyzer ] && [ "${INCTCL}" != "Y" ]; then
  rm ${DIR}/usr/bin/sqlite3_analyzer
fi
