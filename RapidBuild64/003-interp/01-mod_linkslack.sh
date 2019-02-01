#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f *.txz *.xzm

if [ "${INCCYTHON}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/Cython-*.txz
fi

if [ "${INCMAKO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/Mako-*.txz
fi

if [ "${INCMESON}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/meson-*.txz
fi

if [ "${INCPERL}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/perl-*.txz
fi

if [ "${INCPYTHON}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/python3-3.?.*-*-?.txz
  linkpackage ${SLACKPKGDIR}/d/python-2.?.*-*-?.txz
fi

if [ "${INCPYTHONPIP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/python-pip-*.txz
fi
if [ "${INCPYTHONSETUPTOOLS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/python-setuptools-*.txz
fi

if [ "${INCPYCURL}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/pycurl-*.txz
fi

if [ "${INCPYTHONPYPARSING}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/python-pyparsing-*.txz
fi

if [ "${INCPYTHONAPPDIRS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/python-appdirs-*.txz
fi

if [ "${INCPYTHONCERTIFI}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/python-certifi-*.txz
fi

if [ "${INCPYTHONCHARDET}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/python-chardet-*.txz
fi

if [ "${INCPYTHONDOCUTILS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/python-docutils-*.txz
fi

if [ "${INCPYTHONIDNA}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/python-idna-*.txz
fi

if [ "${INCPYTHONPACKAGING}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/python-packaging-*.txz
fi

if [ "${INCPYTHONPILLOW}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/python-pillow-*.txz
fi

if [ "${INCPYTHONREQUESTS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/python-requests-*.txz
fi

if [ "${INCPYTHONSANE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/python-sane-*.txz
fi

if [ "${INCPYTHONSIX}" == "Y" ]; then
# LLDB needs python-six?
  linkpackage ${SLACKPKGDIR}/l/python-six-*.txz
fi

if [ "${INCPYTHONURLLIBTHREE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/python-urllib3-*.txz
fi

if [ "${INCPYCAIRO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/pycairo-*.txz
fi

if [ "${INCPYGTK}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/pygtk-*.txz
fi

if [ "${INCPYGOBJECT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/pygobject-*.txz
fi

if [ "${INCPYQT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/PyQt-*.txz
fi

if [ "${INCSCONS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/scons-*.txz
fi

if [ "${INCRUBY}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/ruby-*.txz
  linkpackage ${SLACKPKGDIR}/l/libyaml-*.txz
fi

if [ "${INCEXPECT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/tcl/expect-*.txz
fi

if [ "${INCTCL}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/tcl/tcl-*.txz
  linkpackage ${SLACKPKGDIR}/tcl/tk-*.txz
  linkpackage ${SLACKPKGDIR}/tcl/tix-*.txz
  if [ "${INCMOD010XORG}" == "Y" ]; then
    linkpackage ${SLACKPKGDIR}/tcl/tclx-*.txz
  fi
fi
