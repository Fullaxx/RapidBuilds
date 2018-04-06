#!/bin/bash

DISK=`floppy_find.sh`

if [ -z "$DISK" ]; then
  echo "I could not determine the floppy disk device!"
  exit 1
fi

if [ ! -b $DISK ]; then
  echo "$DISK must be a block device!"
  exit 2
fi

if ! lsscsi | grep -q $DISK ; then
  echo "Disk $DISK not found in lsscsi output!"
  exit 2
fi

# fdformat $DISK
mkfs.vfat -I $DISK
dosfslabel $DISK FLOPPY
