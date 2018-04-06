#!/bin/bash

if [ -z "$1" ]; then
  echo "$0 <ip>"
  exit 1
fi

# Stop the Ntpd daemon
/etc/rc.d/rc.ntpd stop

# delete any references to pool.ntp.org
sed -e '/0.pool.ntp.org/d' -i /etc/hosts

# add our reference to pool.ntp.org
echo "Setting NTP server to $1..."
echo "$1 0.pool.ntp.org" >> /etc/hosts

# Start the Ntp daemon
/etc/rc.d/rc.ntpd start
