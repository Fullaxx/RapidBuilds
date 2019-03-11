#!/bin/bash

set -e

usage()
{
  echo "Usage: $0 <disk> <srcdir> <dst mount point>"
  exit 1
}

if [ "$#" != "3" ]; then
  usage
fi

DISK="$1"
SRCDIR="$2"
MNTDIR="$3"

if echo "${DISK}" | grep -q nvme ; then
  RLPARTONE="${DISK}p1"
  RLPARTTWO="${DISK}p2"
  RLPARTTHREE="${DISK}p3"
else
  RLPARTONE="${DISK}1"
  RLPARTTWO="${DISK}2"
  RLPARTTHREE="${DISK}3"
fi

if [ ! -d "${MNTDIR}" ]; then mkdir "${MNTDIR}"; fi
mount "${RLPARTTWO}" "${MNTDIR}" -o noatime

echo "Copying OS from ${SRCDIR} to ${RLPARTTWO} (mounted on ${MNTDIR}) ..."
cp -av "${SRCDIR}/rl" "${MNTDIR}/"

umount "${RLPARTTWO}"
