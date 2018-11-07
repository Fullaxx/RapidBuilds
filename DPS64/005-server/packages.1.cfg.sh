# 005-server options
if [ "${INCMOD005SERVER}" == "Y" ]; then
  INCAPACHEHTTPD="N"
  INCBIND="N"
  INCDNSMASQ="N"
  INCLXC="N"
  INCMARIADB="N"
  INCNETSNMP="N"
  INCPHP="N"
  INCPROFTPD="N"
  INCSAMBA="N"
  INCVSFTPD="N"

# Custom Additions
  INCDARKHTTPD="Y"
  INCLIBMICROHTTPD="Y"
  INCLIBWEBSOCKETS="Y"
# NGINX will bring in perl, dont need it right now
  INCNGINX="N"
  INCNNG="Y"
  INCNOVNC="N"
  INCREDIS="Y"
  INCZEROMQ="Y"
fi
