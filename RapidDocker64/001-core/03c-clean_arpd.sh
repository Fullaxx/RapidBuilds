#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm ${DIR}/sbin/arpd
rm ${DIR}/usr/sbin/arpd
rm ${DIR}/usr/sbin/rarpd
rm -r ${DIR}/var/lib/arpd
