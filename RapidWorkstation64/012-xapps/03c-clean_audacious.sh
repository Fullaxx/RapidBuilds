#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up audacious, if we dont have fluidsynth
if [ "${INCAUDACIOUS}" == "Y" ] && [ "${INCFLUIDSYNTH}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/audacious/Input/amidi-plug.so
fi

# Clean up audacious, if we dont have ffmpeg
if [ "${INCAUDACIOUS}" == "Y" ] && [ "${INCFFMPEG}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/audacious/Input/ffaudio.so
fi

# Clean up audacious, if we dont have pulse
if [ "${INCAUDACIOUS}" == "Y" ] && [ "${INCPULSE}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/audacious/Output/pulse_audio.so
fi

# Clean up audacious, if we dont have SDL2
if [ "${INCAUDACIOUS}" == "Y" ] && [ "${INCSDLTWO}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/audacious/Output/sdlout.so
fi
