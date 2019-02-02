#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ ! -e RLBFILES ]; then
  echo "RLBFILES is missing!"
  exit 1
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
    install -Dp -o root -g root -m 0644 ${FILE} "${DIR}/usr/bin/`basename ${FILE}`"
  done
fi
