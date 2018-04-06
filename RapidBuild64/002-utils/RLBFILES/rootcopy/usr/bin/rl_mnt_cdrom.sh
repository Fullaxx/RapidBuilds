#!/bin/bash

while ! grep -wq "/dev/sr0 /mnt/cdrom" /etc/mtab; do
  if [ x"$1" != "x" ]; then sleep $1; fi
  mount /dev/cdrom
done
