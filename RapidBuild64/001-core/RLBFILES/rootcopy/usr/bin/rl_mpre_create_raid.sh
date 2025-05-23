#!/bin/bash

LEVEL="5"
#LEVEL="0"

#CHUNKSIZE="16384"
CHUNKSIZE="4096"
#CHUNKSIZE="1024"
#CHUNKSIZE="256"
#CHUNKSIZE="64"

DRIVECOUNT="12"
DRIVELIST=""
PARTLIST=""

shopt -s nullglob # enable
# Search for all drives larger than 1TB
for NVME in /dev/nvme*n1; do
  DRIVE=`gdisk -l ${NVME} 2>/dev/null | grep sectors | grep -v 'Total free space' | awk '$3>"2000000000" {print $2}' | cut -d: -f1`
  DRIVELIST+=" ${DRIVE}"
done
shopt -u nullglob # disable

# Format each drive that will belong to the RAID
for DRIVE in ${DRIVELIST}; do
  echo "Formatting ${DRIVE} ..."
  sgdisk -n 1:0:0  ${DRIVE} | grep successfully
  sgdisk -t 1:FD00 ${DRIVE} | grep successfully
  PARTLIST+=" ${DRIVE}p1"
done

# NVMe Raid Creation
unset BITMAPARG
if [ "${LEVEL}" == "5" ]; then
  BITMAPARG="-b internal"
fi
mdadm -C /dev/md/data11 -l ${LEVEL} -n ${DRIVECOUNT} -c ${CHUNKSIZE} ${BITMAPARG} ${PARTLIST}

# Create filesystem with label
# mkfs.ext4 -vv -m0 -O 64bit /dev/md/data11
mkfs.xfs -f -i nrext64=0 -L data11 /dev/md/data11

rl_mpre_raid_speedup.sh
