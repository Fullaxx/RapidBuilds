#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCZEROMQ}" == "Y" ]; then
  rm czmq-*.xzm
  rm jzmq-*.xzm
fi
