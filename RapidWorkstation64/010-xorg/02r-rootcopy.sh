#!/bin/bash

source ../spec.sh
source ./module_spec.sh

SEARCHDIR="RLBFILES/rootcopy/etc/rc.d"
if [ -d ${SEARCHDIR} ]; then
  for FILE in ${SEARCHDIR}/* ; do
    LOCALPATH=`echo ${FILE} | cut -d/ -f3-`
    echo "Installing ${LOCALPATH} ..."
    install -Dp -o root -g root -m 0755 ${FILE} "${DIR}/etc/rc.d/`basename ${FILE}`"
  done
fi

SEARCHDIR="RLBFILES/rootcopy/etc/X11"
if [ -d ${SEARCHDIR} ]; then
  for FILE in ${SEARCHDIR}/* ; do
    LOCALPATH=`echo ${FILE} | cut -d/ -f3-`
    echo "Installing ${LOCALPATH} ..."
    install -Dp -o root -g root -m 0644 ${FILE} "${DIR}/etc/X11/`basename ${FILE}`"
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

SEARCHDIR="RLBFILES/rootcopy/usr/share/rapidlinux"
if [ -d ${SEARCHDIR} ]; then
  for FILE in ${SEARCHDIR}/* ; do
    LOCALPATH=`echo ${FILE} | cut -d/ -f3-`
    echo "Installing ${LOCALPATH} ..."
    install -Dp -o root -g root -m 0644 ${FILE} "${DIR}/usr/share/rapidlinux/`basename ${FILE}`"
  done
fi

if [ "${INCXWD}" != "Y" ]; then
  rm ${DIR}/usr/bin/rl_xwd_ss_*.sh
fi
