#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Set the default timezone to Zulu
rm -f ${DIR}/etc/localtime ${DIR}/etc/localtime-copied-from
ln -s /usr/share/zoneinfo/Zulu ${DIR}/etc/localtime

chmod 0755 ${DIR}/etc/rc.d/rc.ntpd
if [ -r ${DIR}/etc/ntp.conf ]; then
	sed -e 's@server\t127.127.1.0@#server\t127.127.1.0@' -i ${DIR}/etc/ntp.conf
	sed -e 's/#server 0.pool.ntp.org iburst/server 0.pool.ntp.org iburst/' -i ${DIR}/etc/ntp.conf
	sed -e 's/#server 1.pool.ntp.org iburst/server 1.pool.ntp.org iburst/' -i ${DIR}/etc/ntp.conf
	sed -e 's/#server 2.pool.ntp.org iburst/server 2.pool.ntp.org iburst/' -i ${DIR}/etc/ntp.conf
	sed -e 's/#server 3.pool.ntp.org iburst/server 3.pool.ntp.org iburst/' -i ${DIR}/etc/ntp.conf
fi

NTPSNMPDBINARY="${DIR}/usr/sbin/ntpsnmpd"
if [ -e ${NTPSNMPDBINARY} ]; then
  if [ "$INCNETSNMP" != "Y" ]; then
    rm ${NTPSNMPDBINARY}
  fi
fi
