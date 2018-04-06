#!/bin/bash

if [ x"$1" == "x" ]; then
  echo "$0 <disk>"
  exit 11
fi

DISK="$1"

if [ ! -b $DISK ]; then
  echo "$DISK must be a block device!"
  exit -2
fi

mount | grep "$DISK" | cut '-d ' -f1 | xargs -r -n1 umount -v
