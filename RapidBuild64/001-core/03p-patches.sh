#!/bin/bash

source ../spec.sh
source ./module_spec.sh

PATCHESDIR="RLBFILES/patches/220314-startup"
if [ ! -d ${PATCHESDIR}  ]; then
  echo "patches are missing..."
  exit 1
fi

patch ${DIR}/etc/rc.d/rc.udev < ${PATCHESDIR}/rc.udev.diff

patch ${DIR}/etc/rc.d/rc.inet2 < ${PATCHESDIR}/rc.inet2.diff

for DIFF in ${PATCHESDIR}/rc.S-??-*.diff; do patch ${DIR}/etc/rc.d/rc.S <${DIFF}; done

for DIFF in ${PATCHESDIR}/rc.M-??-*.diff; do patch ${DIR}/etc/rc.d/rc.M <${DIFF}; done

for DIFF in ${PATCHESDIR}/rc.6-??-*.diff; do patch ${DIR}/etc/rc.d/rc.6 <${DIFF}; done
