#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ -r ${DIR}/etc/dhcpcd.conf ]; then
  sed -e 's/slaac private/slaac hwaddr/' -i ${DIR}/etc/dhcpcd.conf
fi
