#!/bin/bash

source ../spec.sh
source ./module_spec.sh

echo "/sbin/modprobe configs" >> ${DIR}/etc/rc.d/rc.modules.local
echo "/sbin/modprobe tun" >> ${DIR}/etc/rc.d/rc.modules.local

echo >> ${DIR}/etc/rc.d/rc.modules.local
echo "if /usr/bin/grep flags /proc/cpuinfo | /usr/bin/grep -q vmx; then /sbin/modprobe kvm-intel; fi" >> ${DIR}/etc/rc.d/rc.modules.local

#echo "/sbin/modprobe psmouse" >> ${DIR}/etc/rc.d/rc.modules.local
#echo "/sbin/modprobe rtc-cmos" >> ${DIR}/etc/rc.d/rc.modules.local
#echo "/sbin/modprobe usbhid" >> ${DIR}/etc/rc.d/rc.modules.local
#echo "/sbin/modprobe evdev" >> ${DIR}/etc/rc.d/rc.modules.local

#echo "/sbin/modprobe vboxdrv" >> ${DIR}/etc/rc.d/rc.modules.local
#echo "/sbin/modprobe vboxnetflt" >> ${DIR}/etc/rc.d/rc.modules.local
#echo "/sbin/modprobe vboxnetadp" >> ${DIR}/etc/rc.d/rc.modules.local
