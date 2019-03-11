#!/bin/bash

set -e

usage()
{
  echo "Usage: $0 <disk> <srcdir>"
  exit 1
}

if [ "$#" != "2" ]; then
  usage
fi

DISK="$1"
SRCDIR="$2"

if echo "${DISK}" | grep -q nvme ; then
  RLPARTONE="${DISK}p1"
  RLPARTTWO="${DISK}p2"
else
  RLPARTONE="${DISK}1"
  RLPARTTWO="${DISK}2"
fi

if [ ! -d /boot/efi ]; then mkdir /boot/efi; fi
mount "${RLPARTONE}" /boot/efi

echo "Installing rEFInd ..."
( set -e; cd "/opt/refind"; ./refind-install >/dev/null )
cat "${SRCDIR}/boot/refind/refind.conf" >> /boot/efi/EFI/BOOT/refind.conf

mkdir /boot/efi/rl
cp "${SRCDIR}/boot/vmlinuz" /boot/efi/rl/
cp "${SRCDIR}/boot/irfs.img" /boot/efi/rl/
cp "${SRCDIR}/boot/memtest86.efi" /boot/efi/EFI/tools/
if [ -f ${SRCDIR}/boot/refind/banner.jpg ]; then
  cp "${SRCDIR}/boot/refind/banner.jpg" /boot/efi/banner.jpg
else
  cp "${SRCDIR}/boot/rl.jpg" /boot/efi/banner.jpg
fi

if [ `uname -m` == "x86_64" ]; then
  rm /boot/efi/EFI/BOOT/bootia32.efi
else
  rm /boot/efi/EFI/BOOT/bootx64.efi
fi

# According to https://wiki.debian.org/UEFI, aa64 is for arm64
rm /boot/efi/EFI/BOOT/bootaa64.efi

umount "${RLPARTONE}"
