#!/bin/bash

if [ -z "$1" ]; then
  echo "$0: <interface>"
  exit 1
fi

DEV="$1"
ifconfig ${DEV} && \
route -nv && \
echo && \
cat /etc/resolv.conf
