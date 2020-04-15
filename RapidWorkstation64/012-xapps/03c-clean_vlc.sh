#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up vlc, if we dont have Qt5
if [ "${INCVLC}" == "Y" ] && [ "${INCQTFIVE}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/vlc/plugins/gui/libqt_plugin.so
fi
