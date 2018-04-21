#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# clean up mpg123 if we don't have pulse
if [ "${INCMPGONETWOTHREE}" == "Y" -a "${INCPULSE}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/mpg123/output_pulse.{la,so}
fi

# clean up mpg123 if we don't have sdl
if [ "${INCMPGONETWOTHREE}" == "Y" -a "${INCSDL}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/mpg123/output_sdl.{la,so}
fi
