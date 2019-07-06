#!/bin/bash

# https://en.wikipedia.org/wiki/Multicast_address
# https://www.cyberciti.biz/faq/howto-linux-configuring-default-route-with-ipcommand/

if [ `id -u` != "0" ]; then
  echo "Got Root?"
  exit 1
fi

if [ -z "$1" ]; then
  echo "$0 <dev>"
  exit 2
fi

DEV="$1"

if ! grep -q ${DEV} /proc/net/dev ; then
  echo "${DEV} is not a valid network device!"
  exit 3
fi

echo "Adding route to 224.0.0.0/4 from ${DEV}"
/sbin/route add -net 224.0.0.0 netmask 240.0.0.0 ${DEV}
# /sbin/ip route add 224.0.0.0/4 dev ${DEV}
