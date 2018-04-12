#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up librsvg
if [ "${INCLIBRSVG}" == "Y" -a "${INCGTKTWO}" != "Y" ]; then
  rm ${DIR}/usr/bin/rsvg-view-3
fi
