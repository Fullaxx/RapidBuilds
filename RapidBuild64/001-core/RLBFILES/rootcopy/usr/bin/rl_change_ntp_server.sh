#!/bin/bash

if [ -z "$1" ]; then
  echo "$0 <ip>"
  exit 1
fi

# Stop the ntp daemon
/etc/rc.d/rc.ntpd stop

# delete any references to pool.ntp.org
# dont modify in place to support docker volume mount of /etc/hosts
TEMP=`mktemp`
cat /etc/hosts | sed -e '/0.pool.ntp.org/d' >${TEMP}
cat ${TEMP} >/etc/hosts
rm ${TEMP}

# add our reference to pool.ntp.org
echo "Setting NTP server to $1..."
echo "$1 0.pool.ntp.org gps" >>/etc/hosts
ntpdate $1

# Start the ntp daemon
/etc/rc.d/rc.ntpd start
