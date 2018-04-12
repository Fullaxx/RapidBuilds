#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCMOZILLATHUNDERBIRD}" == "Y" ]; then
  if [ -d ${DIR}/usr/${LIBDIR}/thunderbird-??.?.? ]; then
    cd ${DIR}/usr/${LIBDIR}/
    ln -s `ls -1d thunderbird-*` thunderbird || exit 1
  elif [ -d ${DIR}/usr/${LIBDIR}/thunderbird-??.? ]; then
    cd ${DIR}/usr/${LIBDIR}/
    ln -s `ls -1d thunderbird-*` thunderbird || exit 1
  else
    echo "Could not resolve thunderbird link in ${DIR}/usr/${LIBDIR}/"
    exit 1
  fi
fi

if [ "${INCMOZILLAFIREFOX}" == "Y" ]; then
  if [ -d ${DIR}/usr/${LIBDIR}/firefox-??.? ]; then
    cd ${DIR}/usr/${LIBDIR}/
    ln -s `ls -1d firefox-*` firefox || exit 1
  elif [ -d ${DIR}/usr/${LIBDIR}/firefox-??.?.? ]; then
    cd ${DIR}/usr/${LIBDIR}/
    ln -s `ls -1d firefox-*` firefox || exit 1
  else
    echo "Could not resolve firefox link in ${DIR}/usr/${LIBDIR}/"
    exit 1
  fi
fi

exit 0

#if [ "$RLDEPTRACKING" == "N" -o "$INCCHROMIUM" == "Y" ]; then
# This might be unnecessary - READ RapidLinux DOC about Vivaldi GDrive
#  if [ -d ${DIR}/usr/$LIBDIR/chromium -a -f ${DIR}/opt/google/chrome/libwidevinecdm.so ]; then
#    #cd ${DIR}/usr/$LIBDIR/chromium
#    ln -s /opt/google/chrome/libwidevinecdm.so ${DIR}/usr/$LIBDIR/chromium/libwidevinecdm.so
#  fi
#fi

#if [ "${INCVIRTVIEWER}" == "Y" ]; then
# virt-viewer needs libunistring.so.0
#  ( cd ${DIR}/usr/${LIBDIR}/; ln -s libunistring.so.2 libunistring.so.0 )
#fi
