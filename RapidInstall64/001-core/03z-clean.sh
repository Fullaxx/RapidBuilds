#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f ${DIR}/bin/ping6

rm -f ${DIR}/sbin/arpd

rm -f ${DIR}/usr/bin/dbus-launch

rm -f ${DIR}/usr/bin/grub-mkfont

rm -f ${DIR}/usr/bin/memusagestat

rm -f ${DIR}/usr/sbin/{ninfod,ntpsnmpd}

rm -f ${DIR}/usr/${LIBDIR}/libcups.*
rm -f ${DIR}/usr/${LIBDIR}/libcupsimage.*
rm -f ${DIR}/usr/${LIBDIR}/libldap-*

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
