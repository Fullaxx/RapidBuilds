#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f cdrtools-*.txz

if [ ${INCGNUPGTWO} != "Y" ]; then
# gpg2 needs sqlite
  rm -f sqlite-*.txz
fi
