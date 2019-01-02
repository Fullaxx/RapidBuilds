#!/bin/bash

source ../spec.sh
source ./module_spec.sh

echo "/sbin/modprobe configs" >> ${DIR}/etc/rc.d/rc.modules.local
echo "/sbin/modprobe tun" >> ${DIR}/etc/rc.d/rc.modules.local
echo >> ${DIR}/etc/rc.d/rc.modules.local

cat << EOFF >> ${DIR}/etc/rc.d/rc.modules.local
if [ -d /lib/modules/`uname -r`/kernel/drivers/char/ipmi ]; then
  /sbin/modprobe ipmi_devintf
fi

if /usr/bin/grep flags /proc/cpuinfo | /usr/bin/grep -q vmx; then
  /sbin/modprobe kvm-intel
fi
EOFF

#echo "/sbin/modprobe psmouse" >> ${DIR}/etc/rc.d/rc.modules.local
#echo "/sbin/modprobe rtc-cmos" >> ${DIR}/etc/rc.d/rc.modules.local
#echo "/sbin/modprobe usbhid" >> ${DIR}/etc/rc.d/rc.modules.local
#echo "/sbin/modprobe evdev" >> ${DIR}/etc/rc.d/rc.modules.local

#echo "/sbin/modprobe vboxdrv" >> ${DIR}/etc/rc.d/rc.modules.local
#echo "/sbin/modprobe vboxnetflt" >> ${DIR}/etc/rc.d/rc.modules.local
#echo "/sbin/modprobe vboxnetadp" >> ${DIR}/etc/rc.d/rc.modules.local
