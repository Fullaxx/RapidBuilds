#!/bin/bash

if [ -z "$1" ]; then
  echo -n "Brightness: "
  cat /sys/class/backlight/acpi_video0/brightness
  echo -n "Max: "
  cat /sys/class/backlight/acpi_video0/max_brightness
  exit 0
fi

if [ `id -u` != "0" ]; then
  echo "Got Root?"
  exit 1
fi

if [ "$1" == "max" ]; then
  cat /sys/class/backlight/acpi_video0/max_brightness > /sys/class/backlight/acpi_video0/brightness
else
  echo "$1" > /sys/class/backlight/acpi_video0/brightness
fi
