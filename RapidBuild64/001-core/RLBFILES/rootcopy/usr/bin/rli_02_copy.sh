#!/bin/bash

set -e

usage()
{
  echo "Usage: $0 <disk> <partnum> <srcdir> <dst mount point>"
  exit 1
}

if [ "$#" != "4" ]; then
  usage
fi

DISK="$1"
RLPARTNUM="$2"
RLPART="${DISK}${RLPARTNUM}"
SRCDIR="$3"
MNTDIR="$4"

if [ `uname -m` == "x86_64" ]; then
  LIBDIR="lib64"
else
  LIBDIR="lib"
fi

if [ ! -d "${MNTDIR}" ]; then mkdir "${MNTDIR}"; fi
mount "${RLPART}" "${MNTDIR}" -o noatime

echo "Copying OS from ${SRCDIR} to ${RLPART} (mounted on ${MNTDIR})..."
cp -av "${SRCDIR}"/* "${MNTDIR}"

rm -rf "${MNTDIR}"/boot/grub/i386-pc
cp -a /usr/${LIBDIR}/grub/i386-pc "${MNTDIR}"/boot/grub/

if [ -d "${MNTDIR}"/boot/grub/locale ]; then
  rm -rf "${MNTDIR}"/boot/grub/locale
fi

# for NVMe devices
if echo "${RLPARTNUM}" | grep -q 'p' ; then
  RLPARTNUM=`echo "${RLPARTNUM}" | cut -dp -f2`
fi

sed -e "s/hd0,x/hd0,${RLPARTNUM}/" -i "${MNTDIR}"/boot/grub/grub.cfg
# export NOW=`date "+%Y%m%d%H%M%S"`
# echo -n $NOW | sha1sum
