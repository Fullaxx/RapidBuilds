#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# clean up groff if we don't have X
if [ "${INCGROFF}" == "Y" -a "${INCMOD010XORG}" != "Y" ]; then
  rm ${DIR}/usr/bin/{gxditview,xtotroff}
fi
