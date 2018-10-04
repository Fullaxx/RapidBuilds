#!/bin/bash

bail()
{
	echo "$1"
	exit 1
}

cd /sys/devices/*/*/drm/card?/card?-eDP-?/intel_backlight || \
cd /sys/class/backlight/acpi_video0/ || \
bail "I dont know how to adjust the brightness!"

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
