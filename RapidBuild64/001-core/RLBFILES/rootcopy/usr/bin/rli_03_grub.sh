#!/bin/bash

set -e

usage()
{
  echo "Usage: $0 <disk> <rl dir>"
  exit 1
}

if [ "$#" != "2" ]; then
  usage
fi

DISK="$1"
MNTDIR="$2"

if [ -d ${MNTDIR}/boot ] && [ -d ${MNTDIR}/rl ]; then
  grub-install --disk-module=biosdisk --target=i386-pc --root-directory=${MNTDIR} --no-floppy --recheck ${DISK}
else
  echo "${MNTDIR}/boot or ${MNTDIR}/rl is missing!"
  exit 1
fi
