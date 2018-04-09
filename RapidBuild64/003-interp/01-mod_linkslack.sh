#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f *.txz *.xzm

ln -s ${SLACKPKGDIR}/d/python3-?.?.*-*-?.txz || exit 1
ln -s ${SLACKPKGDIR}/d/meson-*.txz
ln -s ${SLACKPKGDIR}/d/python-pip-*.txz || exit 1

ln -s ${SLACKPKGDIR}/d/python-2.?.*-*-?.txz || exit 1
ln -s ${SLACKPKGDIR}/d/python-setuptools-*.txz || exit 1
ln -s ${SLACKPKGDIR}/d/scons-*.txz
ln -s ${SLACKPKGDIR}/d/Cython-*.txz

ln -s ${SLACKPKGDIR}/l/pycurl-*.txz || exit 1
ln -s ${SLACKPKGDIR}/l/pyparsing-*.txz || exit 1
ln -s ${SLACKPKGDIR}/l/python-appdirs-*.txz || exit 1
ln -s ${SLACKPKGDIR}/l/python-certifi-*.txz || exit 1
ln -s ${SLACKPKGDIR}/l/python-chardet-*.txz || exit 1
ln -s ${SLACKPKGDIR}/l/python-docutils-*.txz || exit 1
ln -s ${SLACKPKGDIR}/l/python-idna-*.txz || exit 1
ln -s ${SLACKPKGDIR}/l/python-packaging-*.txz || exit 1
ln -s ${SLACKPKGDIR}/l/python-requests-*.txz || exit 1
# ln -s ${SLACKPKGDIR}/l/python-sane-*.txz || exit 1 # This also needs xap/sane-1.0.27-x86_64-1.txz
ln -s ${SLACKPKGDIR}/l/python-six-*.txz || exit 1 # LLDB needs python-six
ln -s ${SLACKPKGDIR}/l/python-urllib3-*.txz || exit 1

#if [ "${INCMOD010XORG}" == "Y" ]; then
#  ln -s ${SLACKPKGDIR}/l/pygobject-*.txz
#  ln -s ${SLACKPKGDIR}/l/pycairo-*.txz
#  ln -s ${SLACKPKGDIR}/l/pygtk-*.txz
#  ln -s ${SLACKPKGDIR}/l/libglade-*.txz
#  ln -s ${SLACKPKGDIR}/l/python-pillow-*.txz || exit 1
#fi


if [ "$INCPERL" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/perl-*.txz
fi

if [ "$INCRUBY" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/ruby-*.txz
  ln -s ${SLACKPKGDIR}/l/libyaml-*.txz
fi

if [ "$INCTCL" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/tcl/tcl-*.txz
  ln -s ${SLACKPKGDIR}/tcl/tk-*.txz
  ln -s ${SLACKPKGDIR}/tcl/tix-*.txz
  ln -s ${SLACKPKGDIR}/tcl/tclx-*.txz # Should this move to 010-xorg?
  ln -s ${SLACKPKGDIR}/tcl/expect-*.txz
fi
