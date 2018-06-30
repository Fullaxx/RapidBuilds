#!/bin/bash

source ../spec.sh
source ./module_spec.sh

dir2xzm ${DIR} ${MODULE} >/dev/null
rm -r ${DIR}
