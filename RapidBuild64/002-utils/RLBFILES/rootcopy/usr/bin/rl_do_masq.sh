#!/bin/bash

if [ x"$1" == "x" ]; then
  echo "$0 <dev>"
  exit -1
fi

DEV="$1"

sysctl -w net.ipv4.ip_forward=1

iptables -t nat -A POSTROUTING -o $DEV -j MASQUERADE
