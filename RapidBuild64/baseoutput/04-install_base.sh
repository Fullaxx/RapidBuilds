#!/bin/bash

source ../spec.sh
source ./module_spec.sh
set -e

if [ ! -d ${BOOTDIR} ]; then
  echo "${BOOTDIR} deos not exist!"
  exit 1
fi

if [ ! -d ${BASEDIR} ]; then
  echo "${BASEDIR} deos not exist!"
  exit 1
fi

# Copy the specified kernel
cp ${KERNELPKGDIR}/bzImage ${BOOTDIR}/vmlinuz

# Copy the modules
cp -Lpv *.xzm ${BASEDIR}/
