#!/bin/bash

usage()
{
  echo "Usage: $0 <disk>"
  exit 1
}

if [ "$#" != "1" ]; then
  usage
fi

DISK="$1"
#RLPART="$DISK$2"

if `mount | grep -q $DISK` ; then
  rl_disk_unmount.sh $DISK || exit -1
fi

echo
echo "Zapping $DISK..."
sgdisk -Z $DISK 2>&1 | grep Zapping
partprobe >/dev/null 2>&1
dd if=/dev/zero of=$DISK count=100 2>/dev/null

echo
echo "Creating Partition (1)..."
PARTMBSIZE="1024"
parted -s "$DISK" mklabel msdos
parted -a cylinder -s "$DISK" mkpart primary ext2 1 "$PARTMBSIZE"

echo
echo "Creating Filesystems..."
mkfs.ext2 -q -m0 ${DISK}1
tune2fs -L boot ${DISK}1
