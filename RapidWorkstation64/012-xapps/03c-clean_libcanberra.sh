#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up libcanberra, if we dont have gstreamer
if [ "${INCLIBCANBERRA}" == "Y" ] && [ "${INCGSTREAMER}" != "Y" ]; then
  rm ${DIR}/usr/lib64/libcanberra-*/libcanberra-gstreamer.{so,la}
fi
