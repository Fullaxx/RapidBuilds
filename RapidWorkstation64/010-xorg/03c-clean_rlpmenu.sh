#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up RapidLinux Power Menu if we don't have gtk+2
if [ "${INCGTKTWO}" != "Y" ]; then
  rm ${DIR}/usr/bin/rl_pmenu
fi
