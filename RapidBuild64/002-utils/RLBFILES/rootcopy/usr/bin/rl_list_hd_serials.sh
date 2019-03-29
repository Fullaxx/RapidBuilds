#!/bin/bash

if [ `id -u` != "0" ]; then
  echo "Got Root?"
  exit 1
fi

for ATADEV in /dev/sd?; do
  OUTPUT=`lsscsi | grep ${ATADEV} | awk '$3 == "ATA" {print $NF}'`
  if [ "${OUTPUT}" == "${ATADEV}" ]; then
  echo -n "${ATADEV} "
    rl_sata_drive_info.sh ${ATADEV} | grep 'Serial Number:' | sed -e 's/Serial Number:/Serial/'
  fi
done
