#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Remove old athena widgets
rm -f ${DIR}/usr/${LIBDIR}/{libXaw.so.6,libXaw6.*}

rm -f ${DIR}/fonts.*

if [ -L ${DIR}/etc/X11/xinit/xinitrc ]; then
  rm ${DIR}/etc/X11/xinit/xinitrc
elif [ -f ${DIR}/etc/X11/xinit/xinitrc ]; then
  echo "xinitrc has changed!"
  exit 1
fi

echo "Unzipping all compressed fonts ..."
find ${DIR}/usr/share/fonts -name '*.gz' -exec gunzip {} \;

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

# Clean up libinput
LIBINPUTFILE="${DIR}/usr/libexec/libinput/libinput-debug-gui"
if [ -f ${LIBINPUTFILE} -a "${INCGTKTHREE}" != "Y" ]; then
  rm ${LIBINPUTFILE}
fi

# Clean up harfbuzz if we don't have cairo
if [ "${INCCAIRO}" != "Y" ]; then
  rm ${DIR}/usr/bin/hb-view
fi

# Clean up RapidLinux Power Menu if we don't have gtk+2
if [ "${INCGTKTWO}" != "Y" ]; then
  rm -f ${DIR}/usr/bin/rl_pmenu
fi
