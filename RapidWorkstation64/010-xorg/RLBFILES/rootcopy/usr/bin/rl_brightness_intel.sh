#!/bin/bash

if [ `id -u` != "0" ]; then
  echo "Got Root?"
  exit 1
fi

cd /sys/devices/*/*/drm/card?/card?-eDP-?/intel_backlight || \
cd /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-eDP-1/intel_backlight

if [ -z "$1" ]; then
  cat brightness
  exit 0
fi

if [ "$1" == "max" ]; then
  cat max_brightness > brightness
else
  echo "$1" > brightness
fi
