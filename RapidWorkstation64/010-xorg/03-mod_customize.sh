#!/bin/bash

source ../spec.sh
source ./module_spec.sh

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

# Adjust the xterm defaults
# https://bbs.archlinux.org/viewtopic.php?id=78677
# https://makandracards.com/makandra/8057-xterm-have-a-black-background-by-default
if [ -f ${DIR}/etc/X11/app-defaults/XTerm ]; then
# Set the default colors to a sane value and increase the save lines
  sed -e "s/*saveLines: 1024/xterm*vt100.background: black\nxterm*vt100.foreground: lightgray\n\n*saveLines: 16384/" -i ${DIR}/etc/X11/app-defaults/XTerm

# Set the double click character class to a reasonable default
  sed -e 's/^\!\*charClass:/\*charClass:/' -i ${DIR}/etc/X11/app-defaults/XTerm

# (OLD) Set the default xterm font size to unreadable
# sed -e 's|XTerm.vt100.font: -\*-terminus-medium-r-normal-\*-20|XTerm.vt100.font: -\*-terminus-medium-r-normal-\*-12|' -i ${DIR}/etc/X11/app-defaults/XTerm

# (OLD) Set the double click character class to a reasonable default
# sed -e 's|45-47:48,58:48,64:48|33:48,35:48,37-38:48,43-47:48,58:48,61:48,63-64:48,95:48,126:48|' -i ${DIR}/etc/X11/app-defaults/XTerm
fi
