# 005-server options
if [ "${INCMOD005SERVER}" == "Y" ]; then
# Departure from Default
  INCDNSMASQ="N"
  INCPROFTPD="Y"
  INCSAMBA="Y"
  INCVSFTPD="Y"

# Custom Additions
  INCDARKHTTPD="Y"
  INCLIBMICROHTTPD="Y"
  INCLIBVIRT="Y"
  INCLIBWEBSOCKETS="Y"
  INCMONGOCDRIVER="N"
  INCNGINX="N"
  INCNNG="Y"
  INCNODEZEROTEN="N"
  INCNODEZEROTWELVE="N"
  INCNODEFOUR="N"
  INCNODESIX="N"
  INCNODEEIGHT="N"
  INCNODETEN="N"
  INCNOVNC="N"
  INCQUARK="Y"
  INCREDIS="Y"
  INCZEROMQ="Y"
fi
