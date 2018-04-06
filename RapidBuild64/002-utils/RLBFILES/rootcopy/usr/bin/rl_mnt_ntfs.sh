#!/bin/bash

if [ x"$1" == "x" ]; then
  echo "$0 <dev> <mount point>"
  exit -1
fi

if [ x"$2" == "x" ]; then
  echo "$0 <dev> <mount point>"
  exit -2
fi

DEV="$1"
MNT="$2"

if [ ! -b $DEV ]; then
  echo "$DEV is not a valid block device..."
  echo "$0 <dev> <mount point>"
  exit -3
fi

if [ ! -d $MNT ]; then
  echo "$MNT is not a valid directory..."
  echo "$0 <dev> <mount point>"
  exit -4
fi

mount.ntfs-3g $DEV $MNT -o umask=0133,dmask=0022,noatime
