#!/bin/bash

if [ -z "$1" ]; then
  echo "$0 <netdev>"
  exit 1
fi

if [ ! -r /proc/net/dev ]; then
  echo "/proc/net/dev is not readable!"
  exit 2
fi

if ! grep -q "$1" /proc/net/dev ; then
  echo "$1 is not a valid network device..."
  exit 3
fi

DEV="$1"

/sbin/ifconfig $DEV up
# iwlist $DEV scan | grep -Ei 'ESSID|encryption|signal|cell'
/sbin/iwlist $DEV scan | less
