#!/bin/bash

if [ -z "$1" ]; then
  echo "$0: <dev>"
  exit 1
fi

DEV="$1"

ip -6 addr flush scope link dev $DEV
