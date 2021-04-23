#!/bin/bash

source ../spec.sh
source ./module_spec.sh

cat << EOFF >> ${DIR}/etc/rc.d/rc.modules.local
/sbin/modprobe configs
/sbin/modprobe tun

if /usr/bin/grep flags /proc/cpuinfo | /usr/bin/grep -q vmx; then
  /sbin/modprobe kvm-intel
fi

if /sbin/lspci -v | /usr/bin/grep -qi ASPEED; then
  modprobe ast
fi
EOFF

#echo "/sbin/modprobe psmouse" >> ${DIR}/etc/rc.d/rc.modules.local
#echo "/sbin/modprobe rtc-cmos" >> ${DIR}/etc/rc.d/rc.modules.local
#echo "/sbin/modprobe usbhid" >> ${DIR}/etc/rc.d/rc.modules.local
#echo "/sbin/modprobe evdev" >> ${DIR}/etc/rc.d/rc.modules.local

#echo "/sbin/modprobe vboxdrv" >> ${DIR}/etc/rc.d/rc.modules.local
#echo "/sbin/modprobe vboxnetflt" >> ${DIR}/etc/rc.d/rc.modules.local
#echo "/sbin/modprobe vboxnetadp" >> ${DIR}/etc/rc.d/rc.modules.local
