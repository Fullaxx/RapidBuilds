#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# clean up cdrtools, if we don't have pulse
if [ "${INCPULSE}" != "Y" ]; then
  rm -f ${DIR}/usr/bin/cdda2wav
fi
