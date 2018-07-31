#!/bin/bash

if [ `id -u` != "0" ]; then
	echo "Got Root?"
	exit 1
fi

if [ -z "$1" ]; then
	echo "Usage: $0 <device>"
	exit 1
fi

DEV="$1"

if [ ! -b ${DEV} ]; then
	echo "${DEV} is not a block device!"
	exit 1
fi

if ! lsscsi | grep -q ${DEV} ; then
  echo "Could not find ${DEV}!"
  exit 1
fi

#device=`lsscsi | grep ${DEV}`
#if [ -z "${DEV}ice" ]; then
#	echo "Error: could not find device: ${DEV}"
#	exit 1
#fi

rl_disk_unmount.sh ${DEV} || ( echo "rl_disk_unmount.sh ${DEV} failed!"; exit 1 )

sync

sdparm --command=stop ${DEV}

KD=`basename ${DEV}`

if [ -r /sys/block/$KD/device/state ]; then
  echo offline > /sys/block/$KD/device/state
fi

if [ -r /sys/block/$KD/device/delete ]; then
  echo 1 > /sys/block/$KD/device/delete
fi

sleep 2
if [ -b ${DEV} ]; then
  echo "${DEV} stop failed!!"
else
  echo "${DEV} successfully stopped!"
fi

#hcil=`echo ${DEV}ice | awk '{split(substr($0, 2, 7),a,":"); print a[1], a[2], a[3], a[4]}'`
#scsiadd -r $hcil
