#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up libfltk, if we dont have cairo
if [ "${INCFLTK}" == "Y" ] && [ "${INCCAIRO}" != "Y" ]; then
  rm ${DIR}/usr/bin/fluid
fi
