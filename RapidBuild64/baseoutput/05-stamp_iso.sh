#!/bin/bash

source ../spec.sh
source ./module_spec.sh
set -e

if [ "$TIMESTAMPEDISO" == "1" ]; then
  TIMESTAMP=`date "+%y%m%d-%H%M%S"`
  ISOFILENAME="${PROJNAME}-${TIMESTAMP}.iso"
else
  ISOFILENAME="${PROJNAME}.iso"
fi

# Build the ISO
( cd ${SLAXDIR}; ./make_iso.sh ${ISOOUTPUTDIR}/${ISOFILENAME} && echo "${ISOOUTPUTDIR}/${ISOFILENAME} created" || echo "ISO CREATION FAILED!" )

# Clean Up
rm -r ${BDIR}