#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCFTPSYNC}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/ftpsync/ftpsync-20180521-noarch-bksrc1.xzm"
fi

if [ "${INCPASTEBINIT}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/pastebinit/pastebinit-1.5-noarch-bksrc1.xzm"
fi

if [ "${INCPYXDG}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/pyxdg/pyxdg-0.26-noarch-bksrc1.xzm"
fi

if [ "${INCWEBSOCKIFY}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/noNVC/websockify-20180531-noarch-bksrc1.xzm"
fi
