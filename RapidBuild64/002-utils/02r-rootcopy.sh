#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ ! -e RLBFILES ]; then
  echo "RLBFILES is missing!"
  exit 1
fi

SEARCHDIR="RLBFILES/rootcopy/etc"
if [ -d ${SEARCHDIR} ]; then
  for FILE in ${SEARCHDIR}/* ; do
    LOCALPATH=`echo ${FILE} | cut -d/ -f3-`
    echo "Installing ${LOCALPATH} ..."
    install -Dp -o root -g root -m 0644 ${FILE} "${DIR}/etc/`basename ${FILE}`"
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

SEARCHDIR="RLBFILES/rootcopy/usr/libexec/mc/ext.d"
if [ -d ${SEARCHDIR} ]; then
  for FILE in ${SEARCHDIR}/* ; do
    LOCALPATH=`echo ${FILE} | cut -d/ -f3-`
    echo "Installing ${LOCALPATH} ..."
    install -Dp -o root -g root -m 0755 ${FILE} "${DIR}/usr/libexec/mc/ext.d/`basename ${FILE}`"
  done
fi

if [ -x ${DIR}/usr/bin/rl_autosave.sh ]; then
  chmod 0700 ${DIR}/usr/bin/rl_autosave.sh
fi

if [ -x ${DIR}/usr/bin/rl_mnt_floppy.sh ]; then
  ln -s rl_mnt_floppy.sh ${DIR}/usr/bin/rl_floppy_mnt.sh
fi
