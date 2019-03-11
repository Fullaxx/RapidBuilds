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

# Refind Conf and Banner
install -D -m 0644 RLBFILES/boot/refind/refind.conf ${BDIR}/shell/boot/refind/refind.conf
if [ -f RLBFILES/boot/refind/banner.jpg ]; then
  install -D -m 0644 RLBFILES/boot/refind/banner.jpg ${BDIR}/shell/boot/refind/banner.jpg
fi
