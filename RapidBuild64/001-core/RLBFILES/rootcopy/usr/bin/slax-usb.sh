#!/bin/bash
# Jayflod's script to format USB with 2 partitions and install slax on it
# Modifications for Slax-Remix by fanthom

# Variables
c='\e[36m'
r='\e[31m'
e=`tput sgr0`

# Set exit on error
if ! command; then echo "command failed"; exit 1; fi

# Check if user is root
userstat=($(whoami))
if [[ $userstat -ne "root" ]]
then
echo -e "${c}Sorry, you must be root to run this script. press enter to exit"$e
read
exit 1
fi

# Welcome message
clear
echo -e "${c}Welcome in Slax2usb installer by jayflood (modified by fanthom for Slax-Remix needs).
This tool will let you:
- set 2 partitions on usb stick: 1st one will be formatted with FAT32 fs and 2nd one with any linux fs (useful for saving changes on it)
- copy Slax to linux fs formatted one
- make pendrive bootable with slax."$e
echo -e "${r}Be aware that size of pendrive must be bigger than existing Slax installation."$e
echo -e "${c}Dbus will be disabled for the time of running this script.

press enter to continue or ctrl+c to exit"$e
read
echo

# Get path to slax data
CDVD=`grep "Slax data found in" -A 1 /mnt/live/var/log/livedbg | tail -n1 | rev | cut -d/ -f2- | rev`
CDSLAX=/mnt/live$CDVD

# Check presence of slax data
if [ -d $CDSLAX/boot -a -d $CDSLAX/slax ]; then
echo -e "${c}slax data found in $CDSLAX folder"$e
else
echo -e "${c}couldn't find slax data (/boot and /slax folders) in $CDSLAX directory. press enter to exit"$e
read
exit 1
fi

# Disable Dbus daemon
/etc/rc.d/rc.messagebus stop > /dev/null 2>&1

echo -e "${c}Please plug your stick in and press enter when ready"$e
read
sleep 3

# Check if device is removable - if not exit
CHKREM=($(dmesg | tail -n3 | grep removable | awk '{print $5}' | sed -e s/.$// | sed -e s/^.//))
echo
if [ "$CHKREM" = "" ]; then
echo -e "${r}Error: Did not find any REMOVABLE device !!  press enter to exit"$e; read; exit
fi

# Get path to removable device
CHKPRT=($(cat /proc/partitions | tail -n1 | awk '{print$4}'))

# Mount removable device
# Check if device is mounted and mount
if mount | grep -q /mnt/$CHKPRT; then
echo -e "${c}pendrive mounted"$e
else
echo -e "${c}mounting pendrive"$e
mkdir /mnt/$CHKPRT > /dev/null 2>&1
mount /dev/$CHKPRT /mnt/$CHKPRT
fi

# Set device paths in /dev and /mnt style
DEVPATH=/dev/$CHKPRT
MNTPATH=/mnt/$CHKPRT
BASEPATH=$(echo $DEVPATH | rev); BASEPATH=$(echo ${BASEPATH:1} | rev); # E.g takes the 1 from sda1 giving /dev/sda
BASEPATH2=$(echo $MNTPATH | rev); BASEPATH2=$(echo ${BASEPATH2:1} | rev); # Gives same but /mnt/sda

# Get USB size in Mb
USBMB=($(df -h $MNTPATH | grep dev | awk '{print$2}'))

# Make sure the removable device is big enough for slax
USBSIZE=($(fdisk -l /dev/"$CHKREM"1 | grep MB | awk '{print$3}'))
SLAXSIZE=($(du -m $CDSLAX/slax | tail -n1 | awk '{print$1}'))
if [ $USBSIZE -lt $SLAXSIZE ]; then
echo -e "${c}Sorry not enough room on your USB for slax.  press enter to exit"$e; read; exit
fi

# Give message that process will now begin
echo
echo -e "${c}We will now format the USB device with 2 partitions. The first one will be a FAT32 /boot partition.
The second one will be a linux fs (better for storing changes than FAT) for /slax and will use up the remainder of the device.
press enter to continue."$e
read
echo

# Define the size for boot partition
echo -e "${c}Please provide size in megabytes for FAT32 boot partition"$e
echo -e "${r}can't be less than 32M, otherwise system will be unbootable!!"$e
echo -e "${c}example: 64M"$e
read size
echo

# Define the linux filesystem for second partition
echo -e "${c}Please choose linux file system type for the second partition,
currently supported are: ext2, ext3, ext4, xfs, reiserfs and jfs

example: xfs"$e
read fs
echo

if [ "$fs" = "xfs" ]; then
fs="xfs -f"
fi

if [ "$fs" = "reiserfs" -o "$fs" = "jfs"]; then
fs="$fs -q"
fi

# Last chance to exit :)
echo -e "${r}WARNING: you will lose ALL information on the device. Do you want to continue? Answer y/n"$e
read ans
echo
if [ "$ans" != "y" ]; then exit; fi

# unmount removabe device
umount $MNTPATH

echo -e "${c}Organizing partitions now"$e

# Begin formatting
fdisk $BASEPATH << EOF1
d
1
n
p
1

+$size
n
p
2


t
1
b
t
2
83
w
q
EOF1

sleep 1
echo -e "${r}Formatting partitions now. DO NOT REMOVE USB"$e
sleep 2

# Format partitions
mkfs.$fs $BASEPATH'2'
mkdosfs -F 32 $BASEPATH'1'

echo -e "${c}Almost done ...."$e
sleep 1

# Ask user to remove USB and replug
echo -e "${c}Please remove your USB device ... and then plug it back in 
press enter when done."$e
read
sleep 4

# Mount partitions
mount /dev/$CHKREM'1' $BASEPATH2'1'
mkdir /mnt/$CHKREM'2' > /dev/null 2>&1
mount /dev/$CHKREM'2' $BASEPATH2'2'

echo -e "${c}Copying slax data now ... please wait"$e

#Copy boot directory
cp -r $CDSLAX/boot $BASEPATH2'1'/

echo -e "${r}Almost done ... DO NOT remove USB"$e
sleep 2

# Copy slax directories
cp -r $CDSLAX/slax $BASEPATH2'2'/
sleep 1

# Run scipt to make USB bootable
cd $BASEPATH2'1'/boot/
./bootinst.sh

# Start disabled messagebus
/etc/rc.d/rc.messagebus start > /dev/null 2>&1

# Give option to reboot now or later
echo -e "${c}Your USB device should now be bootable with slax.Please ensure your BIOS is set to boot fom USB.
You will need to restart slax now without the CD in. Would you like to reboot slax now? Answer y/n"$e
read reboot

if [ "$reboot" != "y" ]; then exit
else
shutdown -r now
fi
exit