#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up flac if we dont have xmms
if [ "${INCVFOURLUTILS}" == "Y" -a "${INCQT}" != "Y" ]; then
  rm ${DIR}/usr/bin/qv4l2
fi
