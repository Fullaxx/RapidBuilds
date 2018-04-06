#!/bin/bash

source ../spec.sh
source ./module_spec.sh

SAVEDIR="/tmp/LOCALESAVE"
mkdir ${SAVEDIR}

if [ -d ${DIR}/usr/$LIBDIR/locale ]; then
  if [ -d ${DIR}/usr/$LIBDIR/locale/C.utf8 ]; then mv ${DIR}/usr/$LIBDIR/locale/C.utf8 ${SAVEDIR}/; fi
  if [ -d ${DIR}/usr/$LIBDIR/locale/en_US ]; then mv ${DIR}/usr/$LIBDIR/locale/en_US ${SAVEDIR}/; fi
  if [ -d ${DIR}/usr/$LIBDIR/locale/en_US.utf8 ]; then mv ${DIR}/usr/$LIBDIR/locale/en_US.utf8 ${SAVEDIR}/; fi
  rm -rf ${DIR}/usr/$LIBDIR/locale
  mkdir ${DIR}/usr/$LIBDIR/locale
  chmod 0755 ${DIR}/usr/$LIBDIR/locale
  mv ${SAVEDIR}/* ${DIR}/usr/$LIBDIR/locale/
fi

if [ -d ${DIR}/usr/share/locale ]; then
  if [ -d ${DIR}/usr/share/locale/en_US ]; then mv ${DIR}/usr/share/locale/en_US ${SAVEDIR}/; fi
  rm -rf ${DIR}/usr/share/locale
  mkdir ${DIR}/usr/share/locale
  chmod 0755 ${DIR}/usr/share/locale
  if [ -d ${SAVEDIR}/en_US ]; then mv ${SAVEDIR}/en_US ${DIR}/usr/share/locale/; fi
  #mv ${SAVEDIR}/* ${DIR}/usr/share/locale/
fi

if [ -d ${DIR}/usr/share/nano/man-html/fr ]; then
  rm -rf ${DIR}/usr/share/nano/man-html/fr
fi

rm -rf ${SAVEDIR}

# Keyboard Stuff
if [ -d ${DIR}/usr/share/kbd ]; then
  rm -r ${DIR}/usr/share/kbd
fi
