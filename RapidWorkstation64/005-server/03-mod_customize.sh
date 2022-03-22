#!/bin/bash

source ../spec.sh
source ./module_spec.sh

### if [ -f ${DIR}/etc/rc.d/rc.samba ]; then
if [ ${INCSAMBA} == "Y" ]; then
  sed -e 's@#!/bin/sh@#!/bin/bash@' -i ${DIR}/etc/rc.d/rc.samba
  rm ${DIR}/usr/${LIBDIR}/krb5/plugins/kdb/samba.so
  rm ${DIR}/usr/${LIBDIR}/service/kdc.so
fi

if [ -f ${DIR}/etc/rc.d/rc.mysqld ]; then
  sed -e 's/SKIP="--skip-networking"/#SKIP="--skip-networking"/' -i ${DIR}/etc/rc.d/rc.mysqld
fi

PHPPLUG="${DIR}/usr/${LIBDIR}/php/extensions/snmp.so"
if [ -f ${PHPPLUG} ]; then
  if [ "$INCNETSNMP" != "Y" ]; then
    rm -f ${PHPPLUG}
  fi
fi

TRAPPLUG="${DIR}/usr/${LIBDIR}/perl5/vendor_perl/auto/NetSNMP/TrapReceiver/TrapReceiver.so"
if [ -f ${TRAPPLUG} ]; then
  if [ "$INCMARIADB" != "Y" ]; then
    rm -f ${TRAPPLUG}
  fi
fi
