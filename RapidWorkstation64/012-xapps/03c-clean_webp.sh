#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up webp
if [ "${INCLIBWEBP}" == "Y" -a "${INCLIBGIF}" != "Y" ]; then
  rm ${DIR}/usr/bin/gif2webp
fi