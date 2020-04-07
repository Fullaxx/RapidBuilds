#!/bin/bash

if [ -z "$1" ]; then
  echo "$0: <when>"
  exit 1
fi

WHEN=`echo $1 | cut -d. -f1`
NOW=`cat /proc/uptime | awk '{print $1}' | cut -d. -f1`
SEC=`calc "${NOW}-${WHEN}" | awk '{print $1}'`
MIN=`calc "${SEC}/60" | awk '{print $1}'`
HOUR=`calc "${SEC}/3600" | awk '{print $1}'`
DAYS=`calc "${SEC}/86400" | awk '{print $1}'`

echo "S: ${SEC}"
echo "M: ${MIN}"
echo "H: ${HOUR}"
echo "D: ${DAYS}"
