if [ "${INCQTFIVE}" == "Y" ]; then
# enum34 is requried to create PyQT5 bindings (for python2)
  INCENUMTHREEFOUR="Y"
# qtwebengine needs gperf to build
  INCGPERF="Y"
  INCGSTREAMER="Y"
# qt5-5.9.x does not need libxkbcommon
# qt5-5.1]234].x DO need libxkbcommon
  INCLIBXKBCOMMON="Y"
  INCNINJA="Y"
# qtwebengine needs re2c
  INCRETWOC="Y"
# sip is requried to create PyQT5 bindings
  INCSIP="Y"
fi

# ffmpeg ?
