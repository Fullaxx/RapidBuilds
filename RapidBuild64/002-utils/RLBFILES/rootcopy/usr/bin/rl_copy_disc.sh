#!/bin/bash

failure()
{
	echo "The copy failed!"
	exit -1
}

echo "Insert your source disc now..."
echo "Press any key to continue..."
read pause
echo

echo "Creating ISO file from /dev/cdrom now..."
dd if=/dev/cdrom of=/tmp/copy.iso || failure
eject /dev/cdrom

echo "Insert a blank disc now..."
echo "Press any key to continue..."
read pause
echo

echo "Copying disc..."
rl_burn_disc.sh /tmp/copy.iso
