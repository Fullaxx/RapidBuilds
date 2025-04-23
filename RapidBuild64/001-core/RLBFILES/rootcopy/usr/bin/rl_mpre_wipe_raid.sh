#!/bin/bash

# shopt -s nullglob # enable

DRIVELIST=""

for NVME in /dev/nvme*n1; do
  DRIVE=`gdisk -l ${NVME} 2>/dev/null | grep sectors | grep -v 'Total free space' | awk '$3>"2000000000" {print $2}' | cut -d: -f1`
  DRIVELIST+=" ${DRIVE}"
done

for DRIVE in ${DRIVELIST}; do
  BLOCKDEVBASENAME=`basename ${DRIVE}`
  if cat /proc/mdstat | grep -q ${BLOCKDEVBASENAME}; then
    ACTIVERAID=`cat /proc/mdstat | grep ${BLOCKDEVBASENAME}| cut -d: -f1`
    mdadm -S ${ACTIVERAID}
  fi
done

for DRIVE in ${DRIVELIST}; do
  for PART in ${DRIVE}p?; do
    if [ -b ${PART} ]; then
      echo "Wiping ${PART} ..."
      mdadm --zero-superblock ${PART} 2>/dev/null
      wipefs ${PART}
    fi
  done

  echo "Wiping ${DRIVE} ..."
  wipefs ${DRIVE}

  echo "Zapping ${DRIVE} ..."
  sgdisk -Z ${DRIVE} 2>&1 | grep destroyed | cut -f1 -d\!
done

partprobe >/dev/null 2>&1

lsblk | grep nvme

# shopt -u nullglob # disable
