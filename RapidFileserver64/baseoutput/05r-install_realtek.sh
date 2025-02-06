#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ ! -d ${BASEDIR} ]; then
  echo "${BASEDIR} deos not exist!"
  exit 1
fi

verbosecopymodule ${PACKAGESDIR}/realtek/000r-kmods-r8125-9.014.01-${KERNVERS}.xzm ${BASEDIR}/
