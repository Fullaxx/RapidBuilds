#!/bin/bash

if [ "$#" -ne "2" ]; then
  echo "$0 <ip/mask> <dev>"
  exit 1
fi

IPMASK="$1"
DEV="$2"

echo "Adding $IPMASK to $DEV"
ip addr add "$IPMASK" dev "$DEV"