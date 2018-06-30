#!/bin/bash

for HDDEV in /dev/sd?; do
  OUTPUT=`lsscsi | grep $HDDEV | awk '$3 == "ATA" && $4 != "WDC" {print $6}'`
  if [ "${OUTPUT}" == "${HDDEV}" ]; then
  echo -n "${HDDEV} "
    rl_sata_drive_info.sh ${HDDEV} | grep 'Serial Number:' | sed -e 's/Serial Number:/Serial/'
  fi
done
