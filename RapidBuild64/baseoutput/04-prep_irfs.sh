#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ ! -f ${BBMOD} ]; then
  echo "${BBMOD} does not exist!" >&2
  exit 1
fi

# Setup everything for our initramfs
echo "Initializing initramfs ..."
mkdir -p ${IRFSDIR}
xzm2dir ${BBMOD} ${IRFSDIR} >/dev/null
xzm2dir 000-kmods-${KERNVERS}.xzm ${IRFSDIR} >/dev/null

# Clean Busybox and link /bin/sh
rm -rf ${IRFSDIR}/usr
ln -s busybox ${IRFSDIR}/sbin/sh
ln -s sbin ${IRFSDIR}/bin

# Install initramfs scripts
install -D -m 0755 RLBFILES/irfs/init ${IRFSDIR}/init
install -D -m 0755 RLBFILES/irfs/cleanup ${IRFSDIR}/cleanup
install -D -m 0644 RLBFILES/irfs/livekit.irfs.lib ${IRFSDIR}/lib/livekit.irfs.lib
install -D -m 0644 RLBFILES/irfs/rltar_pxedl.irfs.lib ${IRFSDIR}/lib/rltar_pxedl.irfs.lib
