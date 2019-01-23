#!/bin/bash

bail()
{
  echo "$1"
  exit 1
}

if [ `id -u` != "0" ]; then
  bail "Got Root?"
fi

if [ -z "$1" ]; then
  bail "Usage: $0 <device>"
fi

DEV="$1"

if [ ! -b "${DEV}" ]; then
  bail "${DEV} is not a block device!"
fi

if ! /usr/bin/lsscsi | grep -q ${DEV} ; then
  bail "Could not find ${DEV}!"
fi

/usr/bin/rl_disk_unmount.sh ${DEV} || bail "rl_disk_unmount.sh ${DEV} failed!"

sync

/usr/sbin/sdparm --command=stop ${DEV}

KD=`basename ${DEV}`

sleep 2

if [ -r /sys/block/${KD}/device/state ]; then
  echo offline > /sys/block/${KD}/device/state
fi

sleep 2

if [ -r /sys/block/${KD}/device/delete ]; then
  echo 1 > /sys/block/${KD}/device/delete
fi

sleep 2

if [ -b ${DEV} ]; then
  bail "${DEV} stop failed!!"
else
  echo "${DEV} successfully stopped!"
fi

#hcil=`echo $device | awk '{split(substr($0, 2, 7),a,":"); print a[1], a[2], a[3], a[4]}'`
#scsiadd -r $hcil
