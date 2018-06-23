#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f *.txz *.xzm

if [ "${INCAPACHEHTTPD}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/httpd-*.txz
fi

if [ "${INCBIND}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/bind-*.txz
fi

if [ "${INCDNSMASQ}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/dnsmasq-*.txz
fi

if [ "${INCLXC}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/lxc-*.txz
  linkpackage ${SLACKPKGDIR}/a/libcgroup-*.txz
fi

if [ "${INCMARIADB}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/mariadb-*.txz
fi

if [ "${INCNETSNMP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/net-snmp-*.txz
fi

if [ "${INCPHP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/php-*.txz
fi

if [ "${INCPROFTPD}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/proftpd-*.txz
fi

if [ "${INCSAMBA}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/samba-*.txz
fi

if [ "${INCVSFTPD}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/vsftpd-*.txz
fi
