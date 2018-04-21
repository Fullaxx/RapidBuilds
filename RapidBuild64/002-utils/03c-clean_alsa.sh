#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# clean up alsa if we don't have python
if [ "${INCALSA}" == "Y" -a "${INCPYTHON}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/alsa-lib/smixer/smixer-python.so
fi
