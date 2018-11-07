#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up pkgtools
if [ "${INCPKGTOOLS}" == "Y" ]; then
  rm -r ${DIR}/var/log/setup
  rmdir ${DIR}/var/lib/pkgtools/setup/tmp
fi
