#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "$TIMESTAMPEDISO" == "1" ]; then
  TIMESTAMP=`date "+%y%m%d-%H%M%S"`
  ISOFILENAME="${PROJNAME}-${TIMESTAMP}.iso"
else
  ISOFILENAME="${PROJNAME}.iso"
fi

# Set Permissions
chown -R root.root ${SLAXDIR}

# Build the ISO
( cd ${SLAXDIR}; ./make_iso.sh ${ISOOUTPUTDIR}/${ISOFILENAME} && echo "${ISOOUTPUTDIR}/${ISOFILENAME} created" || echo "ISO CREATION FAILED!" )
