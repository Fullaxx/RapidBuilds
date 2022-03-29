#!/bin/bash

source ../spec.sh
source ./module_spec.sh

cat << EOFF >> ${DIR}/etc/rc.d/rc.modules.local

/sbin/modprobe ipmi_devintf

# Load driver for Dektec cards
/sbin/modprobe Dta

# Check for the presence of a ICE PIC card
# If found, Insert the picdrv module and make ice nodes in /dev
if /sbin/lspci -vn | grep -q '1172:7777' ; then
  echo "ICE card found"
  if [ -x /etc/rc.d/rc.icepic ]; then
    /etc/rc.d/rc.icepic start
  fi
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
EOFF
