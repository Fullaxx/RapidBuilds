#!/bin/bash

# usage: $0 | sort -u

findoccur()
{
  USC=`echo $1 | tr '-' '_'`
  HYP=`echo $1 | tr '_' '-'`
  find /lib/modules/*/kernel/ -type f -name "$1.ko"
  find /lib/modules/*/kernel/ -type f -name "$ALT.ko"
  find /lib/modules/*/kernel/ -type f -name "$HYP.ko"
}

for KMOD in `lsmod | grep -v 'Size  Used by' | awk '{print $1}'` ; do
  findoccur ${KMOD}
  # echo ${KMOD}
done

