#!/bin/bash

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
RLPART="$DISK$RLPARTNUM"
SRCDIR="$3"
MNTDIR="$4"

if [ `uname -m` == "x86_64" ]; then
  LIBDIR="lib64"
else
  LIBDIR="lib"
fi

if [ ! -d "$MNTDIR" ]; then
  mkdir "$MNTDIR" 2>/dev/null
fi

mount "$RLPART" "$MNTDIR" -o noatime

echo "Copying OS from $SRCDIR to $RLPART (mounted on $MNTDIR)..."
cp -av "$SRCDIR"/* "$MNTDIR"

# ROOTCOPY="$MNTDIR/slax/rootcopy"
# mkdir -p "$ROOTCOPY/etc/rc.d"
# cp -a /etc/{HOSTNAME,hosts,passwd,group,shadow} "$ROOTCOPY/etc/"
# cp -a /etc/rc.d/rc.rl_boot_services "$ROOTCOPY/etc/rc.d/"
# cp -a /etc/rc.d/rc.local "$ROOTCOPY/etc/rc.d/"
# cp -a /etc/rc.d/rc.local_shutdown "$ROOTCOPY/etc/rc.d/"
# cp -a /etc/rc.d/rc.inet1.conf "$ROOTCOPY/etc/rc.d/"

rm -rf "$MNTDIR"/boot/grub/i386-pc
cp -a /usr/$LIBDIR/grub/i386-pc "$MNTDIR"/boot/grub/

if [ -d "$MNTDIR"/boot/grub/locale ]; then
  rm -rf "$MNTDIR"/boot/grub/locale
fi

sed -e "s/hd0,x/hd0,$RLPARTNUM/" -i "$MNTDIR"/boot/grub/grub.cfg
# export NOW=`date "+%Y%m%d%H%M%S"`
# echo -n $NOW | sha1sum