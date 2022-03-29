#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# chmod +x 03d-disablectrlaltdel.sh

ROOTCOPYDIR="BAREMETAL/rootcopy"
if [ ! -d ${ROOTCOPYDIR}  ]; then
  echo "ROOTCOPYDIR is missing..."
  exit 1
fi

FILE="etc/docker/daemon.json"; install -D -o root -g root -m 0644 "${ROOTCOPYDIR}/${FILE}" "${DIR}/${FILE}"

FILE="usr/bin/nvDeviceQuery"; install -D -o root -g root -m 0755 "${ROOTCOPYDIR}/${FILE}" "${DIR}/${FILE}"
