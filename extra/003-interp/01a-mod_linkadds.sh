#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCPYTHONCONFIGOBJ}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/configobj-5.0.8-${ARCH}-bksrc2.xzm"
fi

if [ "${INCDISTLIB}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/distlib-0.3.4-${ARCH}-bksrc1.xzm"
fi

if [ "${INCDSTAT}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/dstat-0.7.3-noarch-bksrc1.xzm"
fi

if [ "${INCFILELOCK}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/filelock-3.8.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCFTPSYNC}" == "Y" ]; then
# ftpsync needs File-Listing
# File-Listing needs HTTP-Date
  linkpackage "${PACKAGESDIR}/perl_mods/HTTP-Date-6.02-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/perl_mods/File-Listing-6.04-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/perl_mods/ftpsync-20180521-noarch-bksrc1.xzm"
fi

if [ "${INCNUMPY}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/numpy-1.21.6-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPANDAS}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/pandas-1.3.5-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPASTEBINIT}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/pastebinit-1.5-noarch-bksrc1.xzm"
fi

if [ "${INCPYTHONDATEUTIL}" == "Y" ]; then
# python-dateutil needs six,setuptools_scm??
# http://slackbuilds.org/repository/14.2/python/python-dateutil/
  linkpackage "${PACKAGESDIR}/python_mods/python-dateutil-2.8.2-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPYTZ}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/pytz-2023.3-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPYYAML}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/PyYAML-5.3-${ARCH}-bksrc1.xzm"
fi

if [ "${INCRDIFFBACKUP}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/librsync/librsync-0.9.7-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/rdiff-backup-2.0.5-${ARCH}-bksrc1.xzm"
fi

#if [ "${INCSETUPTOOLSSCM}" == "Y" ]; then
#  linkpackage "${PACKAGESDIR}/python_mods/setuptools_scm-3.2.0-${ARCH}-bksrc1.xzm"
#fi

if [ "${INCTERMINATOR}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/terminator-2.1.3-${ARCH}-bksrc2.xzm"
fi

if [ "${INCVIRTUALENV}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/virtualenv-20.17.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCWEBSOCKIFY}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/websockify-20190530-noarch-bksrc1.xzm"
fi
