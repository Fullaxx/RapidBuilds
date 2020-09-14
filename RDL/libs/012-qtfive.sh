if [ "${INCQTFIVE}" == "Y" ]; then
  INCSLACKQTFIVE="Y"
  INCCUSTOMQTFIVE="N"

  if [ "${INCSLACKQTFIVE}" == "Y" ] && [ "${INCCUSTOMQTFIVE}" == "Y" ]; then
    bail "Choose INCSLACKQTFIVE or INCCUSTOMQTFIVE"
  fi

  if [ "${INCSLACKQTFIVE}" == "Y" ]; then
    INCOPENALSOFT="Y"
    INCHUNSPELL="Y"
    INCWOFFTWO="Y"
    INCHYPHEN="Y"
  fi

#  if [ "${INCCUSTOMQTFIVE}" == "Y" ]; then
#    enum34 is requried to create PyQT5 bindings (for python2)
#    INCENUMTHREEFOUR="Y"

#    sip is requried to create PyQT5 bindings
#    INCSIP="Y"
#  fi

# qt5-5.9.x does not need libxkbcommon
# qt5-5.1]2345].x DO need libxkbcommon
  INCLIBXKBCOMMON="Y"
  INCGSTREAMER="Y"
  INCXCBUTILIMAGE="Y"
  INCXCBUTILKEYSYMS="Y"
  INCXCBUTILRENDERUTIL="Y"
  INCXCBUTILWM="Y"
fi
