#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up gegl if we dont have ffmpeg
if [ "${INCGEGL}" == "Y" -a "${INCFFMPEG}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/gegl-?.?/ff-load.{so,la}
  rm ${DIR}/usr/${LIBDIR}/gegl-?.?/ff-save.{so,la}
fi
