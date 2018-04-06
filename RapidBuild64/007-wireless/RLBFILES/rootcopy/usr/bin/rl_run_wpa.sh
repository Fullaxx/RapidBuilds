#!/bin/bash

CF="/etc/wpa_supplicant.conf"

if [ x"$1" == "x" ]; then
  echo "$0 <netdev>"
  exit -1
fi

DEV="$1"

grep -q $DEV /proc/net/dev
if [ "$?" != "0" ]; then
  echo "$DEV does not exist..."
  exit -2
fi

grep -q 'disabled=0' $CF
if [ "$?" != "0" ]; then
  echo "All wpa_supplicant configurations are disabled..."
  exit -3
fi

screen wpa_supplicant -c"$CF" -i"$DEV"
