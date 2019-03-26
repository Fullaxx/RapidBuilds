#!/bin/bash

if [ ! -b /dev/sr0 ]; then
  echo "/dev/sr0 does not exist!"
  sleep 9
  exit 1
fi

if mount | grep ' on /mnt/cdrom' ; then
  echo "Something is already mounted on /mnt/cdrom"
  sleep 9
  exit 1
fi

while ! grep -wq "/dev/sr0 /mnt/cdrom" /etc/mtab; do
  if [ x"$1" != "x" ]; then sleep "$1"; fi
  mount /dev/sr0 /mnt/cdrom
done
