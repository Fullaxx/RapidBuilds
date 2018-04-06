#!/bin/bash

if [ ! -e /dev/disk/by-label/FLOPPY ]; then
  echo "I see no labelled floppy in this system."
  exit 1
fi

if grep -wq "/mnt/floppy" /etc/mtab; then
  echo "FLOPPY seems to already be mounted on /mnt/floppy"
  exit 2
fi

mount /dev/disk/by-label/FLOPPY /mnt/floppy || exit 3
