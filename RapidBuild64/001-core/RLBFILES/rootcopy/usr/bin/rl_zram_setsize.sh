#!/bin/bash

if [ `id -u` != "0" ]; then
	echo "Got Root?"
	exit 1
fi

if [ -z "$1" ]; then
  echo "Usage: $0 <zram dev> <\# of MB>"
  echo "Example: $0 zram0 64"
  exit 1
fi

if [ -b "/dev/$1" ]; then
  echo "$2"000000 > /sys/block/"$1"/disksize
  echo "/dev/$1 is ready!"
else
  echo "/dev/$1 is not a valid block device!"
fi

# mke2fs -q -m0 "/dev/$1"
