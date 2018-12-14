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
mkdir -p ${BDIR}/shell
tar xf ${RLSHELL} -C ${BDIR}/shell

mkdir ${BDIR}/shell/rl
mkdir ${BDIR}/shell/rl/base
mkdir ${BDIR}/shell/rl/modules
mkdir ${BDIR}/shell/rl/optional
mkdir ${BDIR}/shell/rl/rootcopy

install -D -m 0644 RLBFILES/boot/rl.cfg ${BDIR}/shell/boot/rl.cfg
install -D -m 0644 RLBFILES/boot/rl.jpg ${BDIR}/shell/boot/rl.jpg
install -D -m 0644 RLBFILES/boot/isolinux/isolinux.cfg ${BDIR}/shell/boot/isolinux/isolinux.cfg
install -D -m 0644 RLBFILES/boot/syslinux/syslinux.cfg ${BDIR}/shell/boot/syslinux/syslinux.cfg
install -D -m 0644 RLBFILES/boot/grub/grub.cfg ${BDIR}/shell/boot/grub/grub.cfg
install -D -m 0755 RLBFILES/rl/make_iso.sh ${BDIR}/shell/rl/make_iso.sh

if [ ! -f ${BBMOD} ]; then
  echo "${BBMOD} does not exist!" >&2
  exit 1
fi

# Setup everything for our initramfs
echo "Initializing initramfs ..."
mkdir -p ${IRFSDIR}
xzm2dir ${BBMOD} ${IRFSDIR} >/dev/null
xzm2dir ${KERNELPKGDIR}/000-kmods-${KERNVERS}.xzm ${IRFSDIR} >/dev/null

# Clean Busybox and link /bin/sh
rm -rf ${IRFSDIR}/usr
ln -s busybox ${IRFSDIR}/sbin/sh
ln -s sbin ${IRFSDIR}/bin

# Install initramfs scripts
install -D -m 0755 RLBFILES/irfs/init ${IRFSDIR}/init
install -D -m 0755 RLBFILES/irfs/cleanup ${IRFSDIR}/cleanup
install -D -m 0644 RLBFILES/irfs/livekit.irfs.lib ${IRFSDIR}/lib/livekit.irfs.lib
install -D -m 0644 RLBFILES/irfs/rltar_pxedl.irfs.lib ${IRFSDIR}/lib/rltar_pxedl.irfs.lib
