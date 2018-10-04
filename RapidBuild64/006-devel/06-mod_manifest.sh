#!/bin/bash

source ../spec.sh
source ./module_spec.sh

mkdir -p ${DIR}/usr/share/rapidlinux/manifests
ls -1 *.txz > ${DIR}/usr/share/rapidlinux/manifests/${MODNUM}-${MODNAME}.txt
