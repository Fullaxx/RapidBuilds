#!/bin/bash

usage()
{
  echo "Usage: $0 <disk> <source media>"
  echo "Usage: $0 <disk> <source directory>"
  echo
  echo "To Install to blank hard drive from CD"
  echo "$0 /dev/sda /dev/sr0"
  exit 1
}

if [ "$#" == "0" -o "$#" -gt "2" ]; then
  usage
fi

if [ x"$1" == "x" ]; then
  usage
fi

DISK="$1"
HAVESLAXSOURCE="0"

if [ ! -b $DISK ]; then
  echo "$DISK must be a block device!"
  exit 2
fi

if ! lsscsi | grep -q $DISK ; then
  echo "Disk $DISK not found in lsscsi output!"
  exit 2
fi

SYSBLOCKPATH=`echo $DISK | sed -e 's@dev@sys/block@'`
if [ ! -e $SYSBLOCKPATH ]; then
  echo "Disk $SYSBLOCKPATH not found in sys filesystem!"
  exit 2
fi

if [ -d /mnt/slaxsource ]; then
  umount /mnt/slaxsource 2>/dev/null
fi

if [ "$#" == "1" ]; then
  if [ -r ./boot -a -r ./slax ]; then
    SOURCE=`pwd`
  else
    echo "Provide a source media location..."
    echo "Aborting Install..."
    exit 3
  fi
fi

if [ "$#" == "2" ]; then
  if [ -b "$2" -o -d "$2" ]; then
    SOURCE="$2"
  else
    echo "Second Argument must be a CD/Disk or directory..."
    echo "Aborting Install..."
    exit 3
  fi
fi

SRCDIR=`mount | grep $SOURCE | awk '{print $3}'`
if [ -n "$SRCDIR" ]; then
  if [ -r "$SRCDIR"/boot -a -r "$SRCDIR"/slax ]; then
    echo "Found slax media in $SRCDIR..."
    HAVESLAXSOURCE="1"
  fi
fi

if [ "$HAVESLAXSOURCE" == "0" -a -b "$SOURCE" ]; then
  if [ ! -d /mnt/slaxsource ]; then mkdir /mnt/slaxsource; fi
  mount "$SOURCE" /mnt/slaxsource
  if [ "$?" != "0" ]; then
    echo "Could not mount $SOURCE..."
    echo "Aborting Install!"
    exit 4
  fi
  if [ -r /mnt/slaxsource/boot -a -r /mnt/slaxsource/slax ]; then
    SRCDIR="/mnt/slaxsource"
    echo "Found slax media in $SRCDIR..."
    HAVESLAXSOURCE="1"
  fi
fi

if [ "$HAVESLAXSOURCE" == "0" -a -d "$SOURCE" ]; then
  if [ -r "$SOURCE"/boot -a -r "$SOURCE"/slax ]; then
    SRCDIR="$SOURCE"
    echo "Found slax media in $SRCDIR..."
    HAVESLAXSOURCE="1"
  fi
fi

if [ "$HAVESLAXSOURCE" == "0" ]; then
  echo "Could not find slax media..."
  echo "Aborting Install!"
  exit 5
fi

echo "This will *erase* $DISK and install RapidLinux onto it!"
echo "Are you sure you want to do this (y/n)"
read ANS

if [ "$ANS" != "y" ]; then
  echo "Aborting Install!"
  exit 6
fi

if [ `uname -m` == "x86_64" ]; then
  NEXTSCRIPT="rli_01_gdisk.sh"
  RLPARTNUM="2"
else
  NEXTSCRIPT="rli_01_fdisk.sh"
  RLPARTNUM="1"
fi

#RLPART="$DISK$RLPARTNUM"
MNTDIR="/mnt/newos"

$NEXTSCRIPT $DISK && rli_02_copy.sh $DISK $RLPARTNUM $SRCDIR $MNTDIR && rli_03_install.sh $DISK $MNTDIR && \
echo && echo "You may reboot now and boot from your RapidLinux hard drive! ($DISK)" && exit 0

echo "An Unknown Error Occured!"