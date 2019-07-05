#!/bin/bash

if [ `id -u` != "0" ]; then
  echo "Got Root?"
  exit 1
fi

sync && echo 3 > /proc/sys/vm/drop_caches
