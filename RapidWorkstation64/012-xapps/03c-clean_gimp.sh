#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up gimp, if we dont have alsa
if [ "${INCGIMP}" == "Y" ] && [ "${INCALSA}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/gimp/?.?/modules/libcontroller-midi.{so,la}
fi
