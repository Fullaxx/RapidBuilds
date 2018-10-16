#!/bin/bash

for BLOCKDEV in `dmesg | grep "2880 512-byte logical blocks" | cut -d[ -f2- | cut -d] -f1 | uniq`; do
	DISK="/dev/${BLOCKDEV}"
	if [ -b ${DISK} ]; then
		if lsscsi | grep -q ${DISK} ; then
			echo ${DISK}
			exit 0
		fi
	fi
done

exit 1
