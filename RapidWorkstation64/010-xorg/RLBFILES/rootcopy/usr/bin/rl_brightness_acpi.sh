#!/bin/bash

cd /sys/class/backlight/acpi_video0/ || exit 1

if [ -z "$1" ]; then
  echo -n "Brightness: "
  cat brightness
  echo -n "Max: "
  cat max_brightness
  exit 0
fi

if [ `id -u` != "0" ]; then
  echo "Got Root?"
  exit 1
fi

if [ "$1" == "max" ]; then
  cat max_brightness > brightness
else
  echo "$1" > brightness
fi
