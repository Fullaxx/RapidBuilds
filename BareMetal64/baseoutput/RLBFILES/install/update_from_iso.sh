#!/bin/bash

set -e

if [ -z "$1" ]; then
  >&2 echo "$0: <ISO>"
  exit 1
fi

if [ `id -u` != "0" ]; then
  >&2 echo "Got Root?"
  exit 2
fi

if [ ! -f /boot/rl/vmlinuz ]; then
  >&2 echo "/boot is not mounted properly!"
  exit 3
fi

if [ ! -d /mnt/os/rl/base ]; then
  >&2 echo "/mnt/os is not mounted properly!"
  exit 4
fi

# Determine the boot partition
BOOTPART=`mount | awk '$3=="/boot" {print $1}'`
echo "mount ${BOOTPART} /boot -o remount,rw ..."
mount ${BOOTPART} /boot -o remount,rw

# Mount the ISO file
ISO="$1"
TMPDIR=`mktemp -d`
echo "mount ${ISO} ${TMPDIR} ..."
mount ${ISO} ${TMPDIR}

# Update the OS
cp -av ${TMPDIR}/boot/{vmlinuz,irfs.img} /boot/rl/
cp -av ${TMPDIR}/rl/{base,modules} /mnt/os/rl/

# Clean up
umount ${TMPDIR}
rmdir ${TMPDIR}

cd /
mount ${BOOTPART} /boot -o remount,ro
sync

echo "Now go check for duplicate modules under /mnt/os/rl/{base,modules}"
