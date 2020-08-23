#!/bin/bash

if [ `id -u` != "0" ]; then
  echo "Got Root?"
  exit 1
fi

if [ ! -e /sys/kernel/debug/sleep_time ]; then
# mount -t debugfs nodev /sys/kernel/debug
  mount -t debugfs debugfs /sys/kernel/debug
fi
