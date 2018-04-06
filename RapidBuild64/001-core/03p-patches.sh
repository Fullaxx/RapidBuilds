#!/bin/bash

source ../spec.sh
source ./module_spec.sh

PATCHESDIR="RLBFILES/patches"
if [ ! -d ${PATCHESDIR}  ]; then
  echo "patches are missing..."
  exit 1
fi

patch ${DIR}/etc/hosts < ${PATCHESDIR}/localhost6.diff || exit 1

for DIFF in ${PATCHESDIR}/rc.S-??-*.diff; do patch ${DIR}/etc/rc.d/rc.S < ${DIFF} || exit 1; done

for DIFF in ${PATCHESDIR}/rc.M-??-*.diff; do patch ${DIR}/etc/rc.d/rc.M < ${DIFF} || exit 1; done

for DIFF in ${PATCHESDIR}/rc.6-??-*.diff; do patch ${DIR}/etc/rc.d/rc.6 < ${DIFF} || exit 1; done

patch ${DIR}/etc/rc.d/rc.udev < ${PATCHESDIR}/rc.udev-01-shm.diff || exit 1

patch ${DIR}/etc/rc.d/rc.modules < ${PATCHESDIR}/rc.modules-01-nodepmod.diff || exit 1

patch ${DIR}/etc/rc.d/rc.inet2 < ${PATCHESDIR}/rc.inet2.diff || exit 1
