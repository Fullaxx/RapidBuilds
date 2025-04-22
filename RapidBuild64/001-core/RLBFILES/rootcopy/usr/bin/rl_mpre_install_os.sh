#!/bin/bash

if [ -z "$1" ]; then
  echo "$0: <ISO>"
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "$1 is not a file!"
  exit 2
fi

if file $1 | grep 'ISO 9660 CD-ROM filesystem data'; then
#  ISO="$1"
  mount $1 /mnt/cdrom
fi

shopt -s nullglob # enable

DRIVELIST=""
PARTLIST=""

# Search for all drives smaller than 1TB
for NVME in /dev/nvme*n1; do
  DRIVE=`gdisk -l ${NVME} 2>/dev/null | grep sectors | grep -v 'Total free space' | awk '$3<"2000000000" {print $2}' | cut -d: -f1`
  DRIVELIST+=" ${DRIVE}"
done

echo "Found" ${DRIVELIST}
rapidlinux_install.sh ${DRIVELIST} /mnt/cdrom
umount /mnt/cdrom

shopt -u nullglob # disable
