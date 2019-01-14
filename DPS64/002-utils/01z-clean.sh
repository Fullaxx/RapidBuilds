#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f cdrtools-*.txz

# DPS64/009-xmodlibs/ca-certificates-*.txz needs dcron
# do we need certs?
# rm -f dcron-*.txz

if [ ${INCGNUPGTWO} != "Y" ]; then
# gpg2 needs sqlite
  rm -f sqlite-*.txz
fi

rm -f wget-*.txz
