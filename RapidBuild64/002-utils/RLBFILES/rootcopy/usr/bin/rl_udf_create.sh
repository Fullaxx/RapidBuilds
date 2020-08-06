#!/bin/bash

if [ -z "$1" ]; then
  echo "$0 <disk>"
  exit 1
fi

if lsscsi | grep -q "$1" ; then
  echo "$1 found"
  echo
else
  echo "$1 not found"
  exit 2
fi

DEV="$1"
dd if=/dev/zero of=${DEV} bs=512 count=1 2>/dev/null
mkudffs --utf8 -b 512 --media-type=hd ${DEV}
