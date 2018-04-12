#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up audacious, if we dont have fluidsynth
if [ "${INCAUDACIOUS}" == "Y" -a "${INCFLUIDSYNTH}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/audacious/Input/amidi-plug.so
fi

# Clean up audacious, if we dont have ffmpeg
if [ "${INCAUDACIOUS}" == "Y" -a "${INCFFMPEG}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/audacious/Input/ffaudio.so
fi

# Clean up audacious, if we dont have pulse
if [ "${INCAUDACIOUS}" == "Y" -a "${INCPULSE}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/audacious/Output/pulse_audio.so
fi

# Clean up audacious, if we dont have SDL2
if [ "${INCAUDACIOUS}" == "Y" -a "${INCSDLTWO}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/audacious/Output/sdlout.so
fi
