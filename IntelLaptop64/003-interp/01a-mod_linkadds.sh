#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCPASTBINIT}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/pastebinit/pastebinit-1.5-noarch-bksrc1.xzm"
fi
