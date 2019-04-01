#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# clean up mpg123, if we don't have pulse
if [ "${INCMPGONETWOTHREE}" == "Y" ] && [ "${INCPULSE}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/mpg123/output_pulse.so
fi

# clean up mpg123, if we don't have sdl
if [ "${INCMPGONETWOTHREE}" == "Y" ] && [ "${INCSDL}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/mpg123/output_sdl.so
fi
