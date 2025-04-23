#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up gstreamer
if [ "${INCGSTREAMER}" == "Y" ]; then

if [ "${INCCDPARANOIA}" != "Y" ]; then
# gst-plugins-base-*.txz
  rm ${DIR}/usr/${LIBDIR}/gstreamer-1.0/libgstcdparanoia.so
fi

if [ "${INCLIBVISUAL}" != "Y" ]; then
# gst-plugins-base-*.txz
  rm ${DIR}/usr/${LIBDIR}/gstreamer-1.0/libgstlibvisual.so
fi

if [ "${INCLIBSOUP}" != "Y" ]; then
# gst-plugins-good-*.txz
  rm ${DIR}/usr/${LIBDIR}/gstreamer-1.0/libgstsoup.so
fi

if [ "${INCTAGLIB}" != "Y" ]; then
# gst-plugins-good-*.txz
  rm ${DIR}/usr/${LIBDIR}/gstreamer-1.0/libgsttaglib.so
fi

if [ "${INCFLUIDSYNTH}" != "Y" ]; then
# gst-plugins-bad-free-*.txz
  rm ${DIR}/usr/${LIBDIR}/gstreamer-1.0/libgstfluidsynthmidi.so
fi

# gst-plugins-bad-free-*.txz
# libgstqroverlay.so needs l/qrencode-*.txz
if [ "${INCQRENCODE}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/gstreamer-1.0/libgstqroverlay.so
fi

# gst-plugins-bad-free-*.txz (needs libXZing.so)
# libgstzxing.so needs l/zxing-cpp-*.txz
if [ "${INCZXINGCPP}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/gstreamer-1.0/libgstzxing.so
fi

if [ "${INCQTSIX}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/gstreamer-1.0/libgstqml6.so
fi

fi
