#!/bin/bash

for DRIVE in /dev/nvme*n1; do
  gdisk -l ${DRIVE} | grep sectors | grep -v 'Total free space'
done
