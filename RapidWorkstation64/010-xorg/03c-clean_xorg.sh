#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up xorg, if we don't have mesa
if [ "${INCMESA}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/xorg/modules/extensions/libglx.so
  rm ${DIR}/usr/${LIBDIR}/xorg/modules/libglamoregl.so
#  /usr/bin/Xfbdev is gone as of xorg-server-1.20.0 ?
#  rm ${DIR}/usr/bin/Xfbdev
fi
