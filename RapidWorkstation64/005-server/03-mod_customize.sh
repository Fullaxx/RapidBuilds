#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ -e ${DIR}/etc/rc.d/rc.samba ]; then
  sed -e 's@#!/bin/sh@#!/bin/bash@' -i ${DIR}/etc/rc.d/rc.samba
fi

if [ -e ${DIR}/etc/rc.d/rc.mysqld ]; then
  sed -e 's/SKIP="--skip-networking"/#SKIP="--skip-networking"/' -i ${DIR}/etc/rc.d/rc.mysqld
fi

PHPPLUG="${DIR}/usr/${LIBDIR}/php/extensions/snmp.so"
if [ -e ${PHPPLUG} ]; then
  if [ "$INCNETSNMP" != "Y" ]; then
    rm -f ${PHPPLUG}
  fi
fi

TRAPPLUG="${DIR}/usr/${LIBDIR}/perl5/vendor_perl/auto/NetSNMP/TrapReceiver/TrapReceiver.so"
if [ -e ${TRAPPLUG} ]; then
  if [ "$INCMARIADB" != "Y" ]; then
    rm -f ${TRAPPLUG}
  fi
fi
