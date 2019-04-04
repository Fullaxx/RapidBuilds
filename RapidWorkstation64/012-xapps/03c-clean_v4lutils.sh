#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# /usr/bin/qv4l2 is gone as of ??
# Fri Mar 29 18:24:36 UTC 2019
# l/v4l-utils-1.16.5-x86_64-1.txz:  Upgraded.

# Clean up v4l-utils, if we dont have QT
#if [ "${INCVFOURLUTILS}" == "Y" ] && [ "${INCQT}" != "Y" ]; then
#  rm ${DIR}/usr/bin/qv4l2
#fi
