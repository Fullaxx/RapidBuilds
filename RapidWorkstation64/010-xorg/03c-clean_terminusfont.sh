#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ -L terminus-font-*.txz ]; then
# Clean up console fonts from terminus-font package
  rm -r ${DIR}/usr/share/kbd
  rm -r ${DIR}/usr/doc/terminus-font-*
fi
