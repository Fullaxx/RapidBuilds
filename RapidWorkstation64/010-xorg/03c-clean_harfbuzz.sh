#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up harfbuzz, if we don't have cairo
if [ "${INCCAIRO}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/libharfbuzz-cairo.so.*
  rm ${DIR}/usr/bin/hb-view
fi
