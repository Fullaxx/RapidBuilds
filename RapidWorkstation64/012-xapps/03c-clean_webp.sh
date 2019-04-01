#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up webp, if we dont have giflib
if [ "${INCLIBWEBP}" == "Y" ] && [ "${INCGIFLIB}" != "Y" ]; then
  rm ${DIR}/usr/bin/gif2webp
fi
