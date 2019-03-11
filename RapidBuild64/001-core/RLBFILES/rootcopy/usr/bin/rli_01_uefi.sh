#!/bin/bash

set -e

usage()
{
  echo "Usage: $0 <disk>"
  exit 1
}

if [ "$#" != "1" ]; then
  usage
fi

DISK="$1"

if `mount | grep -q ${DISK}` ; then
  rl_disk_unmount.sh ${DISK} || exit 1
fi

echo
echo "Zapping ${DISK} ..."
sgdisk -Z ${DISK} 2>&1 | grep destroyed | cut -f1 -d\!
partprobe >/dev/null 2>&1
dd if=/dev/zero of=${DISK} count=100 2>/dev/null || true

echo
echo "Creating Partition (1) ..."
sgdisk -n 1:0:+512M ${DISK} | grep successfully
sgdisk -t 1:EF00 ${DISK} | grep successfully
sgdisk -c 1:EFI ${DISK} | grep successfully

echo "Creating Partition (2) ..."
PSIZE="+8192M"
sgdisk -n "2:0:${PSIZE}" ${DISK} | grep successfully
sgdisk -c 2:RL ${DISK} | grep successfully
sgdisk -A 2:set:2 ${DISK} | grep successfully

echo "Creating Partition (3) ..."
sgdisk -n 3:0:0 ${DISK} | grep successfully
sgdisk -c 3:storage ${DISK} | grep successfully

echo
echo "Creating Filesystems ..."

if echo "${DISK}" | grep -q nvme ; then
  RLPARTONE="${DISK}p1"
  RLPARTTWO="${DISK}p2"
  RLPARTTHREE="${DISK}p3"
else
  RLPARTONE="${DISK}1"
  RLPARTTWO="${DISK}2"
  RLPARTTHREE="${DISK}3"
fi

mkfs.vfat "${RLPARTONE}"

mkfs.ext2 -q -m0 "${RLPARTTWO}"
tune2fs -L RL "${RLPARTTWO}"

mkfs.ext4 -q -m0 "${RLPARTTHREE}"
tune2fs -L storage "${RLPARTTHREE}"

# Use ext4 since RapidInstall lacks xfs_utils
# mkfs.xfs "${RLPARTTHREE}"
# xfs_admin -L storage "${RLPARTTHREE}"
