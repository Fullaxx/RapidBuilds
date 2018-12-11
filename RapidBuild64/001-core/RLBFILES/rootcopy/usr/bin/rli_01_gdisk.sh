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
#RLPART="${DISK}$2"

if `mount | grep -q ${DISK}` ; then
  rl_disk_unmount.sh ${DISK} || exit 1
fi

echo
echo "Zapping ${DISK}..."
sgdisk -Z ${DISK} 2>&1 | grep Zapping
partprobe >/dev/null 2>&1
dd if=/dev/zero of=${DISK} count=100 2>/dev/null

echo
echo "Creating Partition (1)..."
sgdisk -n 1:0:+4M ${DISK} | grep successfully
sgdisk -t 1:EF02 ${DISK} | grep successfully
sgdisk -c 1:grub_boot ${DISK} | grep successfully

echo "Creating Partition (2)..."
PSIZE="+4G"
sgdisk -n "2:0:$PSIZE" ${DISK} | grep successfully
sgdisk -c 2:boot ${DISK} | grep successfully
sgdisk -A 2:set:2 ${DISK} | grep successfully

echo "Creating Partition (3)..."
sgdisk -n 3:0:0 ${DISK} | grep successfully
sgdisk -c 3:storage ${DISK} | grep successfully

# According to https://wiki.archlinux.org/index.php/GPT
# Syslinux requires the /boot partition to be marked as "Legacy BIOS Bootable" GPT attribute
# (legacy_boot flag in GNU Parted) to identify the partition
# containing the Syslinux boot files by its MBR boot code gptmbr.bin.
# See Syslinux#GUID_Partition_Table_aka_GPT for more information.

echo
echo "Creating Filesystems..."
mkfs.ext2 -q -m0 ${DISK}2
tune2fs -L boot ${DISK}2

mkfs.ext4 -q -m0 ${DISK}3
tune2fs -L storage ${DISK}3
