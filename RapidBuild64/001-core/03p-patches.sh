#!/bin/bash

source ../spec.sh
source ./module_spec.sh

PATCHESDIR="RLBFILES/patches/181122-startup"
if [ ! -d ${PATCHESDIR}  ]; then
  echo "patches are missing..."
  exit 1
fi

patch ${DIR}/etc/hosts < ${PATCHESDIR}/localhost6.diff

patch ${DIR}/etc/rc.d/rc.udev < ${PATCHESDIR}/rc.udev-01-shm.diff

patch ${DIR}/etc/rc.d/rc.modules < ${PATCHESDIR}/rc.modules-01-nodepmod.diff

patch ${DIR}/etc/rc.d/rc.inet2 < ${PATCHESDIR}/rc.inet2.diff

for DIFF in ${PATCHESDIR}/rc.S-??-*.diff; do patch ${DIR}/etc/rc.d/rc.S < ${DIFF}; done

for DIFF in ${PATCHESDIR}/rc.M-??-*.diff; do patch ${DIR}/etc/rc.d/rc.M < ${DIFF}; done

for DIFF in ${PATCHESDIR}/rc.6-??-*.diff; do patch ${DIR}/etc/rc.d/rc.6 < ${DIFF}; done
