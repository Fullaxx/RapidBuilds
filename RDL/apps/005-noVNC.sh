if [ "${INCNOVNC}" == "Y" ]; then
# while this doesn't depend on tigervnc specifically,
# it will need a backend VNC server to connect to
#  INCTIGERVNC="Y"
  INCWEBSOCKIFY="Y"
fi
