#!/bin/bash

source ../spec.sh
source ./module_spec.sh

cat << EOFF >> ${DIR}/etc/rc.d/rc.modules.local

/sbin/modprobe ipmi_devintf

# Load driver for DDMax cards
/sbin/modprobe ddbridge

# Load driver for Dektec cards
/sbin/modprobe Dta
/sbin/modprobe DtPcie

# Check for the presence of a ICE PIC card
# If found, Insert the picdrv module and make ice nodes in /dev
if /sbin/lspci -vn | grep -q '1172:7777' ; then
  echo "ICE card found"
  if [ -x /etc/rc.d/rc.icepic ]; then
    /etc/rc.d/rc.icepic start
  fi
fi

if [ -x /usr/bin/pic_test ]; then
  ICEROOT="/" /usr/bin/pic_test pic 0 reset
  ICEROOT="/" /usr/bin/pic_test pic 1 reset
  ICEROOT="/" /usr/bin/pic_test pic 2 reset
  ICEROOT="/" /usr/bin/pic_test pic 3 reset
  ICEROOT="/" /usr/bin/pic_test detect
fi

# This will modprobe all necessary nvidia modules
# and setup all necessary nvidia devices under /dev
if [ -x /usr/bin/nvDeviceQuery ]; then
  echo "Setting up nVidia devices ..."
  nvDeviceQuery >/var/log/nvidiaDeviceQuery.log 2>&1
fi

# Start nvidia-persistenced daemon
if [ -x /usr/bin/nvidia-persistenced ]; then
  echo "Starting nvidia-persistenced --user root ..."
  /usr/bin/nvidia-persistenced --user root
fi

# Set EXCLUSIVE_PROCESS with nvidia-smi
if [ -x /usr/bin/nvidia-smi ]; then
  echo "Setting GPU EXCLUSIVE_PROCESS with nvidia-smi ..."
  /usr/bin/nvidia-smi -i 0 -c EXCLUSIVE_PROCESS
  /usr/bin/nvidia-smi -i 1 -c EXCLUSIVE_PROCESS
fi

# Start nvidia-cuda-mps-control daemon
if [ -x /usr/bin/nvidia-cuda-mps-control ]; then
  echo "Starting nvidia-cuda-mps-control -d ..."
  /usr/bin/nvidia-cuda-mps-control -d
fi

EOFF
