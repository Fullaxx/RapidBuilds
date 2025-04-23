#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up GTK4 - I don't want the built in media player
# libmedia-gstreamer.so has a dependency of libgstplayer-1.0.so.0 which pulls in the package gst-plugins-bad-free
# gst-plugins-bad-free has a bunch of dependencies that I don't want right now
# 250216 - UPDATE: We are going to bring in gst-plugins-bad-free

#if [ "${INCGTKFOUR}" == "Y" ]; then
#  rm ${DIR}/usr/${LIBDIR}/gtk-4.0/4.?.?/media/libmedia-gstreamer.so
#fi
