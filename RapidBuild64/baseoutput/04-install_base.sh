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

# Copy the specified kernel
install -D -m 0644 ${KERNELPKGDIR}/bzImage ${BOOTDIR}/vmlinuz
install -D -m 0644 ${PACKAGESDIR}/initramfs/irfs-20181211.img.lz ${BOOTDIR}/irfs.img

# Copy the modules
cp -Lpv *.xzm ${BASEDIR}/
