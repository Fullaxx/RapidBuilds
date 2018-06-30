#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f *.txz *.xzm

# This might be reqd later, libelf, libcurl, libgdmp, libcap, libldap, liblber, libusb, libcups
# ln -s ${SLACKPKGDIR}/a/aaa_elflibs-*.xzm
linkpackage ${SLACKPKGDIR}/l/glibc-2.*.txz
