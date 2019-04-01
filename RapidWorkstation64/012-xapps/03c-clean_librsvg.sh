#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up librsvg, if we dont have GTK-2
if [ "${INCLIBRSVG}" == "Y" ] && [ "${INCGTKTWO}" != "Y" ]; then
  rm ${DIR}/usr/bin/rsvg-view-3
fi
