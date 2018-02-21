#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ ! -r ${RLSHELL} ]; then
  echo "${RLSHELL} deos not exist!"
  exit 1
fi

if [ ! -d ${ISOOUTPUTDIR} ]; then
  echo "${ISOOUTPUTDIR} deos not exist!"
  exit 1
fi

# ${BDIR} might not exist at this point, make it again
mkdir -p ${BDIR}/shell || exit 1
tar xf ${RLSHELL} -C ${BDIR}/shell || exit 1

if [ ! -d ${BOOTDIR} ]; then
  echo "${BOOTDIR} deos not exist!"
  exit 1
fi

if [ ! -d ${BASEDIR} ]; then
  echo "${BASEDIR} deos not exist!"
  exit 1
fi

# Copy the specified kernel
cp ${KERNELPKGDIR}/bzImage ${BOOTDIR}/vmlinuz || exit 1

# Copy the modules
cp -Lpv *.xzm ${BASEDIR}/ || exit 1


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
