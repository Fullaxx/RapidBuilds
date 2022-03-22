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

#echo "Executing STOP command:"
#/usr/sbin/sdparm --command=stop ${DEV}
#sleep 0.5
#sync

KD=`basename ${DEV}`
echo "Marking ${DEV} offline ..."
if [ -r /sys/block/${KD}/device/state ]; then
  echo offline > /sys/block/${KD}/device/state
fi
sleep 0.5
sync

echo "Safely removing ${DEV} ..."
if [ -r /sys/block/${KD}/device/delete ]; then
  echo 1 > /sys/block/${KD}/device/delete
fi

# echo -n "Waiting for ${DEV} to disappear ..."
while [ -b ${DEV} ]; do
  sleep 0.1
  echo -n '.'
done

echo
echo "${DEV} successfully stopped!"
