#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f  ${DIR}/sbin/arpd
rm -f  ${DIR}/usr/sbin/arpd
rm -f  ${DIR}/usr/sbin/rarpd
# rm -fr ${DIR}/var/lib/arpd
