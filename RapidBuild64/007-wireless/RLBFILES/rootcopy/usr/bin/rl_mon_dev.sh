#!/bin/bash

CHAN="1"

if [ "$#" -lt "1" ]; then
  echo "$0 <netdev> [channel]"
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

if [ "$#" -eq "2" ]; then
  CHAN="$2"
fi

echo "Setting $DEV to monitor channel $CHAN..."

iw dev $DEV set monitor control otherbss
iw dev $DEV set channel $CHAN
ifconfig $DEV promisc up
