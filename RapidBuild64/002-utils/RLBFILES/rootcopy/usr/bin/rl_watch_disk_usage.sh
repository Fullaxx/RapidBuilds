#!/bin/bash

# https://unix.stackexchange.com/questions/225095/how-to-get-total-read-and-total-write-iops-in-linux

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

# watch -n1 iostat -dx ${DISK}
iostat -dx 1 ${DISK}
