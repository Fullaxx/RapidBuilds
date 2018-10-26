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
