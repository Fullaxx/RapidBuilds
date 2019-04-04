#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up gcc, if we dont have gcc-go
if [ "${INCGCC}" == "Y" ] && [ "${INCGCCGO}" != "Y" ]; then
  rm ${DIR}/usr/libexec/gcc/x86_64-slackware-linux/*/buildid
  rm ${DIR}/usr/libexec/gcc/x86_64-slackware-linux/*/test2json
  rm ${DIR}/usr/libexec/gcc/x86_64-slackware-linux/*/vet
fi
