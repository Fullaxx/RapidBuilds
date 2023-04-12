#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ ! -d ${IRFSDIR} ]; then
  echo "${IRFSDIR} never got created!"
  exit 1
fi

if [ "$TIMESTAMPEDISO" == "1" ]; then
  TIMESTAMP=`date "+%y%m%d-%H%M%S"`
  ISOFILENAME="${PROJNAME}-${TIMESTAMP}.iso"
else
  ISOFILENAME="${PROJNAME}.iso"
fi

# Copy the specified kernel and save the initramfs
install -D -m 0644 ${KERNELPKGDIR}/bzImage ${BOOTDIR}/vmlinuz

echo "Finalizing initramfs ..."
( set -e; cd ${IRFSDIR} && find . | cpio -H newc -o | lzma > ${BOOTDIR}/irfs.img )

# Set Permissions
chown -R root:root ${RLDIR}

# Build the ISO
cd ${RLDIR}
RLUEFIBOOT="${RLUEFIBOOT}" ./make_iso.sh ${ISOOUTPUTDIR}/${ISOFILENAME} || bail "ISO CREATION FAILED!"

echo "${ISOOUTPUTDIR}/${ISOFILENAME} created"
