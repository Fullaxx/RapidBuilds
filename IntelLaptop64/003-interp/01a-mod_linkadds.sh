#!/bin/bash

source ../spec.sh
source ./module_spec.sh


if [ "${INCFTPSYNC}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/ftpsync/ftpsync-20180521-noarch-bksrc1.xzm"
fi

if [ "${INCPASTBINIT}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/pastebinit/pastebinit-1.5-noarch-bksrc1.xzm"
fi

if [ "${INCPYXDG}" == "Y" ]; then
  linkmodule "${PACKAGESDIR}/pyxdg/pyxdg-0.26-noarch-bksrc1.xzm"
fi
