#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up gstreamer
if [ "${INCGSTREAMER}" == "Y" ]; then

if [ "${INCCDPARANOIA}" != "Y" ]; then
# gst-plugins-base-*.txz
  rm ${DIR}/usr/lib64/gstreamer-1.0/libgstcdparanoia.so
fi

if [ "${INCLIBVISUAL}" != "Y" ]; then
# gst-plugins-base-*.txz
  rm ${DIR}/usr/lib64/gstreamer-1.0/libgstlibvisual.so
fi

if [ "${INCLIBSOUP}" != "Y" ]; then
# gst-plugins-good-*.txz
  rm ${DIR}/usr/lib64/gstreamer-1.0/libgstsoup.so
fi

if [ "${INCTAGLIB}" != "Y" ]; then
# gst-plugins-good-*.txz
  rm ${DIR}/usr/lib64/gstreamer-1.0/libgsttaglib.so
fi

fi
