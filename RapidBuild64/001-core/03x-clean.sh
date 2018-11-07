#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Let's get rid of ${DIR}/var/log/setup
rm -r ${DIR}/var/log/setup
rm ${DIR}/run/lock/pkgtools/ldconfig.lock
rmdir ${DIR}/run/lock/pkgtools

# Clean up dbus and grub
if [ "${INCMOD010XORG}" != "Y" ]; then
  rm ${DIR}/usr/bin/dbus-launch
  rm ${DIR}/usr/bin/grub-mkfont
fi

# Clean up glibc
if [ "${INCGD}" != "Y" ]; then
  rm ${DIR}/usr/bin/memusagestat
fi

# What other libraries from aaa_elflibs-*.txz can we remove?
rm -f ${DIR}/usr/$LIBDIR/libcurl.*
rm -f ${DIR}/usr/$LIBDIR/libasound.*
rm -f ${DIR}/usr/$LIBDIR/libidn2.so.* #Unnecessary here, libidn2 is mandatory in 002-utils

# Not ready for this yet
# rm -f ${DIR}/usr/$LIBDIR/libidn.so.*
# rm -f ${DIR}/usr/$LIBDIR/{libcups,libcupsimage}.*
# rm -f ${DIR}/usr/$LIBDIR/{libjpeg,libturbojpeg,libpng14,libpng16,libtiff,libtiffxx}.*

# from the etc-*.txz package
#if [ -e ${DIR}/tmp/.X11-unix ]; then rmdir ${DIR}/tmp/.X11-unix; fi
#if [ -e ${DIR}/tmp/.ICE-unix ]; then rmdir ${DIR}/tmp/.ICE-unix; fi

if [ -d ${DIR}/mnt/cdrecorder ]; then rmdir ${DIR}/mnt/cdrecorder; fi

if [ -e ${DIR}/etc/rc.d/rc.S.orig ]; then rm ${DIR}/etc/rc.d/rc.S.orig; fi
if [ -e ${DIR}/etc/rc.d/rc.M.orig ]; then rm ${DIR}/etc/rc.d/rc.M.orig; fi
