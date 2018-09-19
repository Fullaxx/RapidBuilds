#!/bin/bash

source ../spec.sh
source ./module_spec.sh

unpacksambalibs()
{

# This is absolutely F%@&ing stupid, that mplayer is hard-linked to samba
(
  cd ${DIR}/

  if [ "${LIBDIR}" == "lib64" ]; then
    tar --wildcards -xvf ${SLACKPKGDIR}/n/samba-*.txz 'usr/lib64/lib*.so.*' 'usr/lib64/lib*.so'
  else
    tar --wildcards -xvf ${SLACKPKGDIR}/n/samba-*.txz 'usr/lib/lib*.so.*' 'usr/lib/lib*.so'
  fi
) || bail "Failed to extract samba libs"

}

if [ "${INCSAMBALIBS}" == "Y" -a "${INCSAMBA}" != "Y" ]; then
  unpacksambalibs
fi

# Firefox, Thunderbird, and Seamonkey each drop this file
# We will erase it and handle it below and a per-package basis
if [ -f ${DIR}/etc/ld.so.conf ]; then
  rm ${DIR}/etc/ld.so.conf
fi

if [ "${INCMOZILLAFIREFOX}" == "Y" ]; then
  mkdir -p ${DIR}/etc/ld.so.conf.d
  echo "/usr/${LIBDIR}/firefox" > ${DIR}/etc/ld.so.conf.d/firefox-${ARCH}.conf
fi

if [ "${INCMOZILLATHUNDERBIRD}" == "Y" ]; then
  mkdir -p ${DIR}/etc/ld.so.conf.d
  echo "/usr/${LIBDIR}/thunderbird" > ${DIR}/etc/ld.so.conf.d/thunderbird-${ARCH}.conf
fi

if [ "${INCSEAMONKEY}" == "Y" ]; then
  mkdir -p ${DIR}/etc/ld.so.conf.d
  echo "/usr/${LIBDIR}/seamonkey" > ${DIR}/etc/ld.so.conf.d/seamonkey-${ARCH}.conf
fi

exit 0

if [ "${INCMOZILLATHUNDERBIRD}" == "Y" ]; then
  mkdir -p ${DIR}/etc/ld.so.conf.d
  echo "/usr/lib64/thunderbird" > ${DIR}/etc/ld.so.conf.d/thunderbird-x86_64.conf
  echo "/usr/lib/thunderbird" > ${DIR}/etc/ld.so.conf.d/thunderbird-x86.conf
  if [ -d ${DIR}/usr/${LIBDIR}/thunderbird-??.?.? ]; then
    cd ${DIR}/usr/${LIBDIR}/
    ln -s `ls -1d thunderbird-*` thunderbird
  elif [ -d ${DIR}/usr/${LIBDIR}/thunderbird-??.? ]; then
    cd ${DIR}/usr/${LIBDIR}/
    ln -s `ls -1d thunderbird-*` thunderbird
  else
    echo "Could not resolve thunderbird link in ${DIR}/usr/${LIBDIR}/"
    exit 1
  fi
fi

if [ "${INCMOZILLAFIREFOX}" == "Y" ]; then
  mkdir -p ${DIR}/etc/ld.so.conf.d
  echo "/usr/lib64/firefox" > ${DIR}/etc/ld.so.conf.d/firefox-x86_64.conf
  echo "/usr/lib/firefox" > ${DIR}/etc/ld.so.conf.d/firefox-x86.conf
  if [ -d ${DIR}/usr/${LIBDIR}/firefox-??.? ]; then
    cd ${DIR}/usr/${LIBDIR}/
    ln -s `ls -1d firefox-*` firefox
  elif [ -d ${DIR}/usr/${LIBDIR}/firefox-??.?.? ]; then
    cd ${DIR}/usr/${LIBDIR}/
    ln -s `ls -1d firefox-*` firefox
  else
    echo "Could not resolve firefox link in ${DIR}/usr/${LIBDIR}/"
    exit 1
  fi
fi

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
