#!/bin/bash

if [ "$#" -ne "2" ]; then
  echo "$0 <ip/mask> <dev>"
  exit 1
fi

IPMASK="$1"
DEV="$2"

if ip addr show "$DEV" | grep -q "$IPMASK" ; then
  echo "Removing $IPMASK from $DEV"
  ip addr del "$IPMASK" dev "$DEV"
else
  echo "$IPMASK not found on $DEV"
fi
