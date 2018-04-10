#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f *.txz *.xzm

if [ "${INCCYTHON}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/Cython-*.txz
fi

if [ "${INCMESON}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/meson-*.txz
fi

if [ "${INCPERL}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/perl-*.txz
fi

if [ "${INCPYTHON}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/python3-?.?.*-*-?.txz || exit 1
  ln -s ${SLACKPKGDIR}/d/python-2.?.*-*-?.txz || exit 1
fi

if [ "${INCPYTHONPIP}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/python-pip-*.txz
fi
if [ "${INCPYTHONSETUPTOOLS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/python-setuptools-*.txz
fi

if [ "${INCPYCURL}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/pycurl-*.txz
fi

if [ "${INCPYTHONPYPARSING}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/python-pyparsing-*.txz
fi

if [ "${INCPYTHONAPPDIRS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/python-appdirs-*.txz
fi

if [ "${INCPYTHONCERTIFI}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/python-certifi-*.txz
fi

if [ "${INCPYTHONCHARDET}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/python-chardet-*.txz
fi

if [ "${INCPYTHONDOCUTILS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/python-docutils-*.txz
fi

if [ "${INCPYTHONIDNA}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/python-idna-*.txz
fi

if [ "${INCPYTHONPACKAGING}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/python-packaging-*.txz
fi

if [ "${INCPYTHONPILLOW}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/python-pillow-*.txz
fi

if [ "${INCPYTHONREQUESTS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/python-requests-*.txz
fi

if [ "${INCPYTHONSANE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/python-sane-*.txz
fi

if [ "${INCPYTHONSIX}" == "Y" ]; then
# LLDB needs python-six?
  ln -s ${SLACKPKGDIR}/l/python-six-*.txz
fi

if [ "${INCPYTHONURLLIBTHREE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/python-urllib3-*.txz
fi

if [ "${INCPYCAIRO}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/pycairo-*.txz
fi

if [ "${INCPYGTK}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/pygtk-*.txz
fi

if [ "${INCPYGOBJECT}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/pygobject-*.txz
fi

if [ "${INCSCONS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/scons-*.txz
fi

if [ "${INCRUBY}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/ruby-*.txz
  ln -s ${SLACKPKGDIR}/l/libyaml-*.txz
fi

if [ "${INCTCL}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/tcl/expect-*.txz
  ln -s ${SLACKPKGDIR}/tcl/tcl-*.txz
  ln -s ${SLACKPKGDIR}/tcl/tk-*.txz
  ln -s ${SLACKPKGDIR}/tcl/tix-*.txz
  if [ "${INCMOD010XORG}" == "Y" ]; then
    ln -s ${SLACKPKGDIR}/tcl/tclx-*.txz
  fi
fi
