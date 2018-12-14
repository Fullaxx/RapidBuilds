#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ ! -d ${BOOTDIR} ]; then
  echo "${BOOTDIR} deos not exist!"
  exit 1
fi

if [ ! -d ${BASEDIR} ]; then
  echo "${BASEDIR} deos not exist!"
  exit 1
fi

# Copy the modules
cp -Lpv *.xzm ${BASEDIR}/
