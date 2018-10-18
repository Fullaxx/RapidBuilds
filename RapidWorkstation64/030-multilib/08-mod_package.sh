#!/bin/bash

source ../spec.sh
source ./module_spec.sh

echo "Creating ${MODULE} ..."
dir2xzm ${DIR} ${MODULE} >/dev/null
rm -r ${DIR}
