#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# If we have pulse, lets use it
# Chrome and Vivaldi wont have sound w/o it - FF will??
if [ "${INCPULSE}" == "Y" ]; then
  chmod 0755 ${DIR}/etc/rc.d/rc.pulseaudio

# Clean up pulse, if we dont have GCONF
#  if [ "${INCGCONF}" != "Y" ]; then
#    rm ${DIR}/usr/libexec/pulse/gconf-helper
#  fi
fi
