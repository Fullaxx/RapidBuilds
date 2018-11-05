#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ ${INCPERL} != "Y" ] && [ ${INCPYTHON} != "Y" ]; then
  rm -f 003-interp.xzm
fi

# VPS doesn't need man pages or documentation
rm -f 020-man.xzm 021-doc.xzm
