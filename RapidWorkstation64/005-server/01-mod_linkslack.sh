#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f *.txz *.xzm

if [ "${INCLXC}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/lxc-*.txz
  ln -s ${SLACKPKGDIR}/ap/cgmanager-*.txz
  ln -s ${SLACKPKGDIR}/a/libcgroup-*.txz
fi

if [ "${INCMARIADB}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/mariadb-*.txz
fi

if [ "${INCPHP}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/php-*.txz
fi

if [ "${INCSAMBA}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/samba-*.txz
fi

if [ "${INCNETSNMP}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/net-snmp-*.txz
fi

if [ "${INCAPACHEHTTPD}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/httpd-*.txz
fi

if [ "${INCPROFTPD}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/proftpd-*.txz
fi

if [ "${INCVSFTPD}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/vsftpd-*.txz
fi
