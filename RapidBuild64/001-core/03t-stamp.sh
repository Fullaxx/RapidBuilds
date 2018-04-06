#!/bin/bash

source ../spec.sh
source ./module_spec.sh

NOW=`date "+%Y%m%d"`
TIMESTAMP=`date "+%y%m%d-%H%M%S"`

rm ${DIR}/etc/slackware-version ${DIR}/etc/os-release
echo "RapidLinux $NOW" > ${DIR}/etc/rapidlinux-version
ln -s /etc/rapidlinux-version ${DIR}/etc/os-release

echo "RapidLinux $TIMESTAMP" | md5sum | awk '{print $1}' > ${DIR}/etc/.rlhash
