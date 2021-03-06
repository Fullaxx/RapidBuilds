#!/bin/bash

BVAL="1000"
GOV="powersave"
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

rl_brightness.sh ${BVAL}
