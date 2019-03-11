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
    install -Dp -o root -g root -m 0755 ${FILE} "${DIR}/etc/profile.d/`basename ${FILE}`"
  done
fi

SEARCHDIR="RLBFILES/rootcopy/etc/rc.d"
if [ -d ${SEARCHDIR} ]; then
  for FILE in ${SEARCHDIR}/* ; do
    LOCALPATH=`echo ${FILE} | cut -d/ -f3-`
    echo "Installing ${LOCALPATH} ..."
    install -Dp -o root -g root -m 0755 ${FILE} "${DIR}/etc/rc.d/`basename ${FILE}`"
  done
fi

SEARCHDIR="RLBFILES/rootcopy/usr/bin"
if [ -d ${SEARCHDIR} ]; then
  for FILE in ${SEARCHDIR}/* ; do
    LOCALPATH=`echo ${FILE} | cut -d/ -f3-`
    echo "Installing ${LOCALPATH} ..."
    install -Dp -o root -g root -m 0755 ${FILE} "${DIR}/usr/bin/`basename ${FILE}`"
  done
fi

SEARCHDIR="RLBFILES/rootcopy/usr/lib"
if [ -d ${SEARCHDIR} ]; then
  for FILE in ${SEARCHDIR}/* ; do
    LOCALPATH=`echo ${FILE} | cut -d/ -f3-`
    echo "Installing ${LOCALPATH} ..."
    install -Dp -o root -g root -m 0644 ${FILE} "${DIR}/usr/lib/`basename ${FILE}`"
  done
fi

for FILE in activate deactivate deb2xzm dir2xzm rpm2xzm txz2xzm xzm2dir; do
  chmod 0700 ${DIR}/usr/bin/${FILE}
done

if [ -x ${DIR}/sbin/rescan-scsi-bus ]; then
  ln -s /sbin/rescan-scsi-bus ${DIR}/usr/bin/rl_sata_rescan.sh
fi

if [ -x ${DIR}/usr/bin/rapidlinux_install.sh ]; then
  chmod 0700 ${DIR}/usr/bin/rapidlinux_install.sh
  chmod 0700 ${DIR}/usr/bin/rli_*.sh
fi

if [ -f RLBFILES/refind.tar ]; then
  tar xf RLBFILES/refind.tar -C ${DIR}/opt
fi
