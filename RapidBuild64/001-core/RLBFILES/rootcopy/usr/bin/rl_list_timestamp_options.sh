#!/bin/bash

if [ -z "$1" ]; then
  echo "$0: <dev>"
  exit 1
fi

DEV="$1"

if ! grep -wq "${DEV}" /proc/net/dev; then
  echo "$1 does not appear to be a network device"
  exit 2
fi

set -e

TCPDUMPBIN=`which tcpdump`
ETHTOOLBIN=`which ethtool`

${ETHTOOLBIN} -i ${DEV} | grep driver
echo
${TCPDUMPBIN} -i ${DEV} -J
echo
${ETHTOOLBIN} -T ${DEV}
