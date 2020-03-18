#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up v4l-utils, if we dont have QT5
if [ "${INCVFOURLUTILS}" == "Y" ] && [ "${INCQTFIVE}" != "Y" ]; then
  rm ${DIR}/usr/bin/qv4l2
  rm ${DIR}/usr/bin/qvidcap
fi
