#!/bin/bash

set -e

if [ "$#" != "2" ]; then
  echo "$0: [SOURCE] [DEST]"
  exit 1
fi

SPROJ="$1"
DPROJ="$2"

if [ -e ${DPROJ} ]; then
  echo "${DPROJ} exists!"
  exit 1
fi

if [ ! -d ./${SPROJ} ]; then
  echo "${SPROJ} not found in current dir!"
  exit 1
fi

mkdir ${DPROJ}
cp ${SPROJ}/spec.sh ${DPROJ}/spec.sh.orig
echo "${SPROJ}/spec.sh copied to ${DPROJ}/spec.sh.orig"

cd ${DPROJ}
ln -s ../${SPROJ} basis
ln -s basis/functions.sh
ln -s basis/rebuild.sh

for MODULE in 001-core 002-utils 003-interp 005-server 006-devel 007-wireless 009-xmodlibs 010-xorg 012-xapps baseoutput; do
  if [ -d ../${SPROJ}/${MODULE} ]; then
    echo "Adding: ${MODULE}"
    mkdir ${MODULE}

    # Symlink each script from each module
    ( cd ${MODULE}; for SCRIPT in ../basis/${MODULE}/*.sh; do SFILE=`basename ${SCRIPT}`; ln -s ../basis/${MODULE}/${SFILE}; done )

    # Check for RLBFILES
    if [ -e ../${SPROJ}/${MODULE}/RLBFILES ]; then
      ( cd ${MODULE}; ln -s ../basis/${MODULE}/RLBFILES )
    fi
  fi
done

echo "${SPROJ} created successfully with a basis of ${DPROJ}"
echo "Dont forget to create spec.sh for ${DPROJ}!"
