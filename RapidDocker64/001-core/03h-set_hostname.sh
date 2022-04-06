#!/bin/bash

source ../spec.sh
source ./module_spec.sh

HOSTNAME="RapidDocker"
echo ${HOSTNAME} >${DIR}/etc/HOSTNAME
sed -e "s/darkstar.example.net darkstar/${HOSTNAME}/g" -i ${DIR}/etc/hosts
