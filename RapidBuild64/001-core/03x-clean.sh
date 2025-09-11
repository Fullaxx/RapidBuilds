#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Let's get rid of ${DIR}/var/log/setup
rm -r ${DIR}/var/log/setup
rm ${DIR}/run/lock/pkgtools/ldconfig.lock
rmdir ${DIR}/run/lock/pkgtools

# Clean up e2fsprogs,grub if we dont have fuse3
if [ "${INCFUSETHREE}" != "Y" ]; then
  rm ${DIR}/usr/bin/fuse2fs
  rm -f ${DIR}/usr/bin/grub-mount
fi

# Clean up dbus and grub
if [ "${INCMOD010XORG}" != "Y" ]; then
  rm -f ${DIR}/usr/bin/dbus-launch
  rm -f ${DIR}/usr/bin/grub-mkfont
fi

# Clean up glibc
if [ "${INCGD}" != "Y" ]; then
  rm ${DIR}/usr/bin/memusagestat
fi

# Fri Aug 22 21:42:24 UTC 2025
# We don't need ffmpeg from a/aaa_libraries
rm -f ${DIR}/usr/${LIBDIR}/libav*
rm -f ${DIR}/usr/${LIBDIR}/libbluray.*
rm -f ${DIR}/usr/${LIBDIR}/libpostproc.*
rm -f ${DIR}/usr/${LIBDIR}/libsw{resample,scale}.*

# What other libraries from aaa_elflibs-*.txz can we remove?
rm -f ${DIR}/usr/${LIBDIR}/libargon2*
rm -f ${DIR}/usr/${LIBDIR}/libasound.*
rm -f ${DIR}/usr/${LIBDIR}/libcurl.*
rm -f ${DIR}/usr/${LIBDIR}/libdvdread.*
rm -f ${DIR}/usr/${LIBDIR}/libexiv2.*
rm -f ${DIR}/usr/${LIBDIR}/libraw.*
rm -f ${DIR}/usr/${LIBDIR}/libraw_r.*
rm -f ${DIR}/usr/${LIBDIR}/libtiff.*
rm -f ${DIR}/usr/${LIBDIR}/libtiffxx.*

# 31 OCT 2020
rm -f ${DIR}/usr/${LIBDIR}/libHalf.*
rm -f ${DIR}/usr/${LIBDIR}/libIex-*
rm -f ${DIR}/usr/${LIBDIR}/libIexMath-*
rm -f ${DIR}/usr/${LIBDIR}/libIlmImf-*
rm -f ${DIR}/usr/${LIBDIR}/libIlmImfUtil-*
rm -f ${DIR}/usr/${LIBDIR}/libIlmThread-*
rm -f ${DIR}/usr/${LIBDIR}/libImath-*
rm -f ${DIR}/usr/${LIBDIR}/libpoppler*
# 31 OCT 2020

# 16 NOV 2020
rm -f ${DIR}/usr/${LIBDIR}/libisl*
# 16 NOV 2020

# 24 APR 2024
rm -f ${DIR}/usr/${LIBDIR}/libgdbm*
rm -f ${DIR}/usr/${LIBDIR}/{libcups,libcupsimage}.*
# 24 APR 2024

# We don't need boost from a/aaa_libraries
rm -f ${DIR}/usr/${LIBDIR}/libboost_*

# Unnecessary here, libidn2 is mandatory in 002-utils
rm -f ${DIR}/usr/${LIBDIR}/libidn2.so.*

# Not ready for this yet
# rm -f ${DIR}/usr/${LIBDIR}/libidn.so.*
# rm -f ${DIR}/usr/${LIBDIR}/{libjpeg,libturbojpeg,libpng14,libpng16}.*

if [ -d ${DIR}/mnt/cdrecorder ]; then rmdir ${DIR}/mnt/cdrecorder; fi

if [ -e ${DIR}/etc/rc.d/rc.S.orig ]; then rm ${DIR}/etc/rc.d/rc.S.orig; fi
if [ -e ${DIR}/etc/rc.d/rc.M.orig ]; then rm ${DIR}/etc/rc.d/rc.M.orig; fi
