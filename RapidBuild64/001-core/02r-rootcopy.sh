#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ ! -e RLBFILES ]; then
  echo "RLBFILES is missing!"
  exit 1
fi

SEARCHDIR="RLBFILES/rootcopy/etc/profile.d"
if [ -d ${SEARCHDIR} ]; then
  for FILE in ${SEARCHDIR}/* ; do
    LOCALPATH=`echo ${FILE} | cut -d/ -f3-`
    echo "Installing ${LOCALPATH} ..."
    install -Dp -o root -g root -m 0755 ${FILE} "${DIR}/etc/profile.d/`basename ${FILE}`" || exit 1
  done
fi

SEARCHDIR="RLBFILES/rootcopy/etc/rc.d"
if [ -d ${SEARCHDIR} ]; then
  for FILE in ${SEARCHDIR}/* ; do
    LOCALPATH=`echo ${FILE} | cut -d/ -f3-`
    echo "Installing ${LOCALPATH} ..."
    install -Dp -o root -g root -m 0755 ${FILE} "${DIR}/etc/rc.d/`basename ${FILE}`" || exit 1
  done
fi

SEARCHDIR="RLBFILES/rootcopy/usr/bin"
if [ -d ${SEARCHDIR} ]; then
  for FILE in ${SEARCHDIR}/* ; do
    LOCALPATH=`echo ${FILE} | cut -d/ -f3-`
    echo "Installing ${LOCALPATH} ..."
    install -Dp -o root -g root -m 0755 ${FILE} "${DIR}/usr/bin/`basename ${FILE}`" || exit 1
  done
fi

if [ -x ${DIR}/sbin/rescan-scsi-bus ]; then
  ln -s /sbin/rescan-scsi-bus ${DIR}/usr/bin/rl_sata_rescan.sh
fi

if [ -x ${DIR}/usr/bin/rapidlinux_install.sh ]; then
  chmod 0700 ${DIR}/usr/bin/rapidlinux_install.sh
  chmod 0700 ${DIR}/usr/bin/rli_01_?disk.sh
  chmod 0700 ${DIR}/usr/bin/rli_02_copy.sh
  chmod 0700 ${DIR}/usr/bin/rli_03_install.sh
fi

if [ -x ${DIR}/usr/bin/rl_sata_drive_stop.sh ]; then
  chmod 0700 ${DIR}/usr/bin/rl_sata_drive_stop.sh
fi

if [ -x ${DIR}/usr/bin/rl_swapiness.sh ]; then
  chmod 0700 ${DIR}/usr/bin/rl_swapiness.sh
fi

if [ -x ${DIR}/usr/bin/rl_free_kmem.sh ]; then
  chmod 0700 ${DIR}/usr/bin/rl_free_kmem.sh
fi

if [ -x ${DIR}/usr/bin/rl_zram_create.sh ]; then
  chmod 0700 ${DIR}/usr/bin/rl_zram_create.sh
  chmod 0700 ${DIR}/usr/bin/rl_zram_setsize.sh
fi