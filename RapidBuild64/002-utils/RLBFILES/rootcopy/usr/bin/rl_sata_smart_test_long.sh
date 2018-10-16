#!/bin/bash

usage()
{
  echo "Usage: $0 <disk>"
  exit 1
}

if [ "$#" == "0" ]; then
  usage
fi

DISK="$1"

if [ ! -b ${DISK} ]; then
  echo "${DISK} must be a block device!"
  exit 2
fi

if ! lsscsi | grep -q ${DISK} ; then
  echo "Disk ${DISK} not found in lsscsi output!"
  exit 2
fi

smartctl -t long ${DISK}

sleep 105m

smartctl -l selftest ${DISK}
# smartctl -a ${DISK}