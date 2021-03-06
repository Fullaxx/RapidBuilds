#!/bin/bash

if [ x"$1" == "x" ]; then
  echo "$0 <drive>"
  exit -1
fi

if [ -b "$1" ]; then
  DEV="$1"
else
  echo "$1 is not a block device!"
  echo "$0 <drive>"
  exit -2
fi

echo $DEV | grep -qE '[0-9]'
if [  "$?" == "0" ]; then
  echo "It appears that you are trying to erase a partition, not a block device..."
  echo "This script should only be used on a raw disk block device (i.e. /dev/sda, *not* /dev/sda1)"
  echo
fi

echo "You are about to erase $DEV"
echo "Is this ok [y/n]? "
read ans

if [ "$ans" != "y" -o "$ans" != "Y"]; then
  echo "aborting erase operation..."
  exit -3
fi

COMMAND="dd if=/dev/zero of=$DEV count=10"

echo
echo "About to run: $COMMAND"
echo "If this is not right, press CTRL-C now!"
sleep 1
echo "3 ..."
sleep 1
echo "2 ..."
sleep 1
echo "1 ..."
sleep 1

$COMMAND

eject $DEV
partprobe -s
rescan-scsi-bus
