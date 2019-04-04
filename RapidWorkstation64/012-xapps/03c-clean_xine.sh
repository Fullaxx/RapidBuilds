#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up xine, if we dont have esound
if [ "${INCXINE}" == "Y" ] && [ "${INCESOUND}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/xine/plugins/?.?/xineplug_ao_out_esd.so
fi
