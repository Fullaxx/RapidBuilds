#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up xmms, if we dont have mesa
if [ "${INCXMMS}" == "Y" ] && [ "${INCMESA}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/xmms/Visualization/libogl_spectrum.{so,la}
fi

# Clean up xmms, if we dont have esound
if [ "${INCXMMS}" == "Y" ] && [ "${INCESOUND}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/xmms/Output/libesdout.{so,la}
fi
