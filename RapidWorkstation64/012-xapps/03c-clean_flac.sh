#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up flac, if we dont have xmms
#if [ "${INCFLAC}" == "Y" ] && [ "${INCXMMS}" != "Y" ]; then
#  rm ${DIR}/usr/${LIBDIR}/xmms/Input/libxmms-flac.{so,la}
#  rmdir ${DIR}/usr/${LIBDIR}/xmms/Input
#  rmdir ${DIR}/usr/${LIBDIR}/xmms
#fi
