#!/bin/bash

source ../spec.sh
source ./module_spec.sh

mknod -m 0600 ${DIR}/dev/console c 5 1 || bail "Error creating dev/console"
mknod -m 0666 ${DIR}/dev/null c 1 3 || bail "Error creating dev/null"

tar xf ${SLACKPKGDIR}/a/devs-*.txz -C ${DIR} dev/MAKEDEV || bail "Error extracting dev/MAKEDEV from a/devs-*.txz"
