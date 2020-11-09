#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCBOKEH}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/bokeh-1.0.4-${ARCH}-bksrc2.xzm"
fi

if [ "${INCCHEETAHTHREE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/cheetah3-3.2.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCONFIGOBJ}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/configobj-5.0.6-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCLICK}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/click-plugins-1.1.1-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/Click-7.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCDISTLIB}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/distlib-0.3.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCDSTAT}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/dstat-0.7.3-noarch-bksrc1.xzm"
fi

#if [ "${INCENUMTHREEFOUR}" == "Y" ]; then
#  linkpackage "${PACKAGESDIR}/python_mods/enum34-1.1.6-${ARCH}-bksrc1.xzm"
#fi

if [ "${INCFILELOCK}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/filelock-3.0.12-${ARCH}-bksrc1.xzm"
fi

if [ "${INCFTPSYNC}" == "Y" ]; then
# ftpsync needs File-Listing
# File-Listing needs HTTP-Date
  linkpackage "${PACKAGESDIR}/perl_mods/HTTP-Date-6.02-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/perl_mods/File-Listing-6.04-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/perl_mods/ftpsync-20180521-noarch-bksrc1.xzm"
fi

if [ "${INCGNURADIO}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/log4cpp/log4cpp-1.1.3-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/gnuradio-3.8.0.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCJINJATWO}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/MarkupSafe-1.1.1-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/Jinja2-2.10-${ARCH}-bksrc2.xzm"
fi

if [ "${INCKEEPNOTE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/keepnote-0.7.8-${ARCH}-bksrc3.xzm"
fi

if [ "${INCKHANSOUL}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/khansoul-2.0.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCLXML}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/lxml-4.3.2-${ARCH}-bksrc1.xzm"
fi

if [ "${INCNUMPY}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/numpy-1.19.4-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPANDAS}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/pandas-1.1.4-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPASTEBINIT}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/pastebinit-1.5-noarch-bksrc1.xzm"
fi

if [ "${INCPSUTIL}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/psutil-5.7.3-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPYTHONDATEUTIL}" == "Y" ]; then
# python-dateutil needs six,setuptools_scm??
# http://slackbuilds.org/repository/14.2/python/python-dateutil/
  linkpackage "${PACKAGESDIR}/python_mods/python-dateutil-2.8.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPYTZ}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/pytz-2020.4-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPYYAML}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/PyYAML-5.3-${ARCH}-bksrc1.xzm"
fi

#if [ "${INCSETUPTOOLSSCM}" == "Y" ]; then
#  linkpackage "${PACKAGESDIR}/python_mods/setuptools_scm-3.2.0-${ARCH}-bksrc1.xzm"
#fi

if [ "${INCTERMINATOR}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/terminator-1.92-${ARCH}-bksrc1.xzm"
fi

if [ "${INCTORNADO}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/tornado-6.0.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCVIRTUALENV}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/virtualenv-20.1.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCWEBSOCKIFY}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/websockify-20190530-noarch-bksrc1.xzm"
fi
