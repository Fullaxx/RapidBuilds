#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up libsamplerate if we dont have libsndfile
if [ "${INCLIBSAMPLERATE}" == "Y" -a "${INCLIBSNDFILE}" != "Y" ]; then
  rm ${DIR}/usr/bin/sndfile-resample
fi
