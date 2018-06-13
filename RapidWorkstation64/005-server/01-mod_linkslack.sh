#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f *.txz *.xzm

if [ "${INCLXC}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/lxc-*.txz
  linkpackage ${SLACKPKGDIR}/a/libcgroup-*.txz
fi

if [ "${INCMARIADB}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/mariadb-*.txz
fi

if [ "${INCPHP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/php-*.txz
fi

if [ "${INCSAMBA}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/samba-*.txz
fi

if [ "${INCNETSNMP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/net-snmp-*.txz
fi

if [ "${INCAPACHEHTTPD}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/httpd-*.txz
fi

if [ "${INCPROFTPD}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/proftpd-*.txz
fi

if [ "${INCVSFTPD}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/vsftpd-*.txz
fi
