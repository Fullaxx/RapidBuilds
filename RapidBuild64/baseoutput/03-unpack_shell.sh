#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ ! -r ${RLSHELL} ]; then
  echo "${RLSHELL} deos not exist!"
  exit 1
fi

if [ ! -d ${ISOOUTPUTDIR} ]; then
  echo "${ISOOUTPUTDIR} deos not exist!"
  exit 1
fi

# ${BDIR} might not exist at this point, make it again
mkdir -p ${BDIR}/shell
tar xf ${RLSHELL} -C ${BDIR}/shell
