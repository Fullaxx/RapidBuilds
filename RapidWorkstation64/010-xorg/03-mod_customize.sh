#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Whatever this was, is now unnecessary
# rm -f ${DIR}/fonts.*

echo "Unzipping all compressed fonts ..."
find ${DIR}/usr/share/fonts -name '*.gz' -exec gunzip {} \;

if [ -L ${DIR}/etc/X11/xinit/xinitrc ]; then
  rm ${DIR}/etc/X11/xinit/xinitrc
elif [ -f ${DIR}/etc/X11/xinit/xinitrc ]; then
  echo "xinitrc has changed!"
  exit 1
fi

# Make sure that X Server doesn't open a TCP listening socket
if [ -d ${DIR}/etc/X11/xinit ]; then
  if [ -f ${DIR}/etc/X11/xinit/xserverrc ]; then
    echo "${DIR}/etc/X11/xinit/xserverrc already exists!"
    exit 1
  else
    echo "#!/bin/sh" > ${DIR}/etc/X11/xinit/xserverrc
    echo 'exec /usr/bin/X -nolisten tcp "$@"' >> ${DIR}/etc/X11/xinit/xserverrc
    chmod 0755 ${DIR}/etc/X11/xinit/xserverrc
  fi
fi

# Set the default font xterm font size to unreadable
# Set the double click character class to a reasonable default
if [ -f ${DIR}/etc/X11/app-defaults/XTerm ]; then
  sed -e 's|XTerm.vt100.font: -\*-terminus-medium-r-normal-\*-20|XTerm.vt100.font: -\*-terminus-medium-r-normal-\*-12|' -i ${DIR}/etc/X11/app-defaults/XTerm
  sed -e 's|45-47:48,58:48,64:48|33:48,35:48,37-38:48,43-47:48,58:48,61:48,63-64:48,95:48,126:48|' -i ${DIR}/etc/X11/app-defaults/XTerm
fi
