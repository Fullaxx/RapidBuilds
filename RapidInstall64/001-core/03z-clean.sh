#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f ${DIR}/bin/ping6

rm -f ${DIR}/sbin/arpd

rm -f ${DIR}/usr/bin/dbus-launch

rm -f ${DIR}/usr/bin/fuse2fs
rm -f ${DIR}/usr/bin/grub-mkfont
rm -f ${DIR}/usr/bin/grub-mount

rm -f ${DIR}/usr/bin/memusagestat

rm -f ${DIR}/usr/sbin/{ninfod,ntpsnmpd}

# We don't need boost from a/aaa_libraries
rm -f ${DIR}/usr/${LIBDIR}/libboost_*

rm -f ${DIR}/usr/${LIBDIR}/libcups.*
rm -f ${DIR}/usr/${LIBDIR}/libcupsimage.*

# Mon Mar 7 01:57:45 UTC 2022
rm -f ${DIR}/usr/${LIBDIR}/libldap*
rm -f ${DIR}/usr/${LIBDIR}/liblber*

rm -f ${DIR}/usr/${LIBDIR}/libjpeg.*
rm -f ${DIR}/usr/${LIBDIR}/libturbojpeg.*

rm -f ${DIR}/usr/${LIBDIR}/libpng??.*

rm -f ${DIR}/usr/${LIBDIR}/libpsl.*

rm -f ${DIR}/usr/${LIBDIR}/libtiff.*
rm -f ${DIR}/usr/${LIBDIR}/libtiffxx.*

rm -f ${DIR}/usr/${LIBDIR}/libvga.*
rm -f ${DIR}/usr/${LIBDIR}/libvgagl.*

rm -f ${DIR}/sbin/tc
rm -f ${DIR}/usr/${LIBDIR}/tc/m_*.so

rm -f ${DIR}/lib64/security/pam_lastlog2.*
rm -f ${DIR}/usr/lib64/liblastlog2.*
rm -f ${DIR}/usr/bin/lastlog2
