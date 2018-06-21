#!/bin/bash

if [ -z "$1" ]; then
  echo "$0: <interface>"
  exit 1
fi

DEV="$1"
watch -n2 rl_list_ip_route_dns.sh ${DEV}
