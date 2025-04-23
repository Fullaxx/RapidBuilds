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

MNTLOC="/boot/efi"
if echo "${DISK}" | grep -q nvme ; then
  RLPARTONE="${DISK}p1"
  RLPARTTWO="${DISK}p2"
else
  RLPARTONE="${DISK}1"
  RLPARTTWO="${DISK}2"
fi

(
  set -e
  echo "Installing rEFInd ..."
  cd /opt/refind && \
  ./refind-install --usedefault ${RLPARTONE} >/dev/null && \
  umount ${RLPARTONE}
)

# Remount our EFI partition and load it
if [ ! -d "${MNTLOC}" ]; then mkdir ${MNTLOC}; fi
mount ${RLPARTONE} ${MNTLOC}
if [ ! -d ${MNTLOC}/EFI/BOOT ]; then echo "refind-install failed!"; exit 1; fi
if [ ! -f ${MNTLOC}/EFI/BOOT/refind.conf ]; then echo "refind-install failed!"; exit 1; fi
sed -e 's/^timeout 20/timeout 5/' -i ${MNTLOC}/EFI/BOOT/refind.conf
cat ${SRCDIR}/install/refind.conf >> ${MNTLOC}/EFI/BOOT/refind.conf

mkdir ${MNTLOC}/rl
cp -v ${SRCDIR}/boot/vmlinuz ${MNTLOC}/rl/
cp -v ${SRCDIR}/boot/irfs.img ${MNTLOC}/rl/
cp -v ${SRCDIR}/boot/memtest86.efi ${MNTLOC}/EFI/tools/
if [ -f ${SRCDIR}/install/banner.jpg ]; then
  cp -v ${SRCDIR}/install/banner.jpg ${MNTLOC}/banner.jpg
else
  cp -v ${SRCDIR}/boot/rl.jpg ${MNTLOC}/banner.jpg
fi

# Install an update script to the boot partition
cp -v ${SRCDIR}/install/update_from_iso.sh ${MNTLOC}/

# Clean up a bit
rm -r ${MNTLOC}/EFI/BOOT/icons/licenses
# According to https://wiki.debian.org/UEFI, aa64 is for arm64
rm ${MNTLOC}/EFI/BOOT/*aa64.efi
if [ `uname -m` == "x86_64" ]; then
  rm ${MNTLOC}/EFI/BOOT/bootia32.efi
else
  rm ${MNTLOC}/EFI/BOOT/bootx64.efi
fi

umount "${RLPARTONE}"
