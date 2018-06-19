#!/bin/bash

source ../spec.sh
source ./module_spec.sh

echo "# Graphics" >> ${DIR}/etc/modprobe.d/blacklist.conf
echo "blacklist ast" >> ${DIR}/etc/modprobe.d/blacklist.conf
echo "blacklist nouveau" >> ${DIR}/etc/modprobe.d/blacklist.conf
echo "blacklist mgag200" >> ${DIR}/etc/modprobe.d/blacklist.conf
echo "blacklist mga" >> ${DIR}/etc/modprobe.d/blacklist.conf

echo >> ${DIR}/etc/modprobe.d/blacklist.conf
echo "# Networking" >> ${DIR}/etc/modprobe.d/blacklist.conf
echo "blacklist i2400m" >> ${DIR}/etc/modprobe.d/blacklist.conf
echo "blacklist i2400m_usb" >> ${DIR}/etc/modprobe.d/blacklist.conf
echo "blacklist wimax" >> ${DIR}/etc/modprobe.d/blacklist.conf
# echo "blacklist ipv6" >> ${DIR}/etc/modprobe.d/blacklist.conf

echo >> ${DIR}/etc/modprobe.d/blacklist.conf
echo "# Old Devices" >> ${DIR}/etc/modprobe.d/blacklist.conf
echo "blacklist parport_pc" >> ${DIR}/etc/modprobe.d/blacklist.conf
echo "blacklist parport" >> ${DIR}/etc/modprobe.d/blacklist.conf
