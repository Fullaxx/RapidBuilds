#!/bin/bash

BVAL="max"
GOV="performance"
CPUS=`nproc`

if [ `id -u` != "0" ]; then
  echo "Got Root?"
  exit 1
fi

COUNT="0"
while [ "${COUNT}" -ne "${CPUS}" ]; do
  cpufreq-set -c ${COUNT} -g ${GOV}
  COUNT=$(( COUNT + 1 ))
done

if [ -d /sys/devices/*/*/drm/card?/card?-eDP-?/intel_backlight ]; then
  BSCRIPT="rl_brightness_intel.sh"
elif [ -d /sys/class/backlight/acpi_video? ]; then
  BSCRIPT="rl_brightness_acpi.sh"
else
  echo "I dont know how to adjust the brightness!"
  exit 1
fi

${BSCRIPT} ${BVAL}
