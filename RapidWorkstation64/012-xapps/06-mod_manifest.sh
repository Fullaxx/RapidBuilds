#!/bin/bash

source ../spec.sh
source ./module_spec.sh

TXZCOUNT=`find . -name "*.txz" | wc -l`
if [ "${TXZCOUNT}" != "0" ]; then
  mkdir -p ${DIR}/usr/share/rapidlinux/manifests
  ls -1 *.txz >> ${DIR}/usr/share/rapidlinux/manifests/${MODNUM}-${MODNAME}.txt
fi

XZMCOUNT=`find . -name "*.xzm" | wc -l`
if [ "${XZMCOUNT}" != "0" ]; then
  mkdir -p ${DIR}/usr/share/rapidlinux/manifests
  ls -1 *.xzm >> ${DIR}/usr/share/rapidlinux/manifests/${MODNUM}-${MODNAME}.txt
fi
