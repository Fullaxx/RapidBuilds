#!/bin/bash

usage()
{
  echo "Usage: $0 <disk> <source media>"
  echo "Usage: $0 <disk> <source directory>"
  echo
  echo "To Install to blank hard drive from CD/DVD"
  echo "$0 /dev/sda /dev/sr0"
  echo
  echo "Here are your disks ..."
  lsblk | grep disk
  exit 1
}

if [ "$#" == "0" ] || [ "$#" -gt "2" ]; then
  usage
fi

if [ x"$1" == "x" ]; then
  usage
fi

DISK="$1"
HAVERLSOURCE="0"

if [ ! -b ${DISK} ]; then
  echo "${DISK} must be a block device!"
  exit 2
fi

DISKDEV=`echo "${DISK}" | cut -d/ -f3`
if ! lsblk | grep disk | grep -q ${DISKDEV} ; then
  echo "Disk ${DISKDEV} not found in lsblk output!"
  exit 3
fi

SYSBLOCKPATH=`echo ${DISK} | sed -e 's@dev@sys/block@'`
if [ ! -e ${SYSBLOCKPATH} ]; then
  echo "Disk ${SYSBLOCKPATH} not found in sys filesystem!"
  exit 4
fi

if [ -d /mnt/rlsource ]; then
  umount /mnt/rlsource 2>/dev/null
fi

if [ "$#" == "1" ]; then
  if [ -d ./boot ] && [ -d ./rl ]; then
    SOURCE=`pwd`
  else
    echo "Provide a source media location..."
    echo "Aborting Install..."
    exit 3
  fi
fi

if [ "$#" == "2" ]; then
  if [ -b "$2" ] || [ -d "$2" ]; then
    SOURCE="$2"
  else
    echo "Second Argument must be a CD/Disk or directory..."
    echo "Aborting Install..."
    exit 5
  fi
fi

SRCDIR=`mount | grep ${SOURCE} | awk '{print $3}'`
if [ -n "${SRCDIR}" ]; then
  if [ -r "${SRCDIR}"/boot ] && [ -r "${SRCDIR}"/rl ]; then
    echo "Found rl media in ${SRCDIR}..."
    HAVERLSOURCE="1"
  fi
fi

if [ "${HAVERLSOURCE}" == "0" ] && [ -b "${SOURCE}" ]; then
  if [ ! -d /mnt/rlsource ]; then mkdir /mnt/rlsource; fi
  mount "${SOURCE}" /mnt/rlsource
  if [ "$?" != "0" ]; then
    echo "Could not mount ${SOURCE}..."
    echo "Aborting Install!"
    exit 6
  fi
  if [ -r /mnt/rlsource/boot ] && [ -r /mnt/rlsource/rl ]; then
    SRCDIR="/mnt/rlsource"
    echo "Found RapidLinux media in ${SRCDIR}..."
    HAVERLSOURCE="1"
  fi
fi

if [ "${HAVERLSOURCE}" == "0" ] && [ -d "${SOURCE}" ]; then
  if [ -r "${SOURCE}"/boot ] && [ -r "${SOURCE}"/rl ]; then
    SRCDIR="${SOURCE}"
    echo "Found RapidLinux media in ${SRCDIR}..."
    HAVERLSOURCE="1"
  fi
fi

if [ "${HAVERLSOURCE}" == "0" ]; then
  echo "Could not find RapidLinux media..."
  echo "Aborting Install!"
  exit 7
fi

if [ -n "${LEGACYGRUB}" ] && [ "${LEGACYGRUB}" == "1" ]; then
  echo "This will *erase* ${DISK} and install RapidLinux with GRUB!"
else
  echo "This will *erase* ${DISK} and install RapidLinux with EFI!"
fi

echo "Are you sure you want to do this (y/N)"
read ANS

if [ "${ANS}" != "y" ]; then
  echo "Aborting Install!"
  exit 8
fi

if [ `uname -m` == "x86_64" ]; then
  NEXTSCRIPT="rli_01_gdisk.sh"
  RLPARTNUM="2"
else
  NEXTSCRIPT="rli_01_fdisk.sh"
  RLPARTNUM="1"
fi

MNTDIR="/mnt/newos"
if echo "${DISK}" | grep -q nvme ; then RLPARTNUM="p2"; fi

if [ "${LEGACYGRUB}" == "1" ]; then
  ${NEXTSCRIPT} ${DISK} && \
  rli_02_copy.sh ${DISK} ${RLPARTNUM} ${SRCDIR} ${MNTDIR} && \
  rli_03_grub.sh ${DISK} ${MNTDIR} || RLIERROR="1"
else
  rli_01_uefi.sh ${DISK} && \
  rli_02_uefi.sh ${DISK} ${SRCDIR} ${MNTDIR} && \
  rli_03_refind.sh ${DISK} ${SRCDIR} || RLIERROR="1"
fi

if [ -n "${RLIERROR}" ]; then
  echo "An Unknown Error Occured!"
  exit 9
fi

echo
echo "You may reboot now and boot from your RapidLinux hard drive! (${DISK})"
