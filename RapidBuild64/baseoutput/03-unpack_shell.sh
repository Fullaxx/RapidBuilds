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
install -D -m 0755 RLBFILES/rl/make_iso.sh ${BDIR}/shell/rl/make_iso.sh

# EFI bootable CD/DVD components
if [ "${RLUEFIBOOT}" == "REFIND" ]; then
  tar xf RLBFILES/UEFI/refind.tar -C ${BDIR}/shell/
#  mkdir -p ${BDIR}/shell/EFI/
#  cp -r RLBFILES/EFI/{BOOT,tools} ${BDIR}/shell/EFI/
  cp -v RLBFILES/boot/refind.conf ${BDIR}/shell/EFI/BOOT/
fi

if [ "${RLUEFIBOOT}" == "GRUB" ]; then
  tar xf RLBFILES/UEFI/grub.tar -C ${BDIR}/shell/
  cp -v RLBFILES/boot/grub.cfg ${BDIR}/shell/boot/grub/
fi

# Template Grub Config for install
install -D -m 0644 RLBFILES/install/grub/grub.cfg ${BDIR}/shell/install/grub.cfg

# Template Refind Config for install
install -D -m 0644 RLBFILES/install/refind/refind.conf ${BDIR}/shell/install/refind.conf
if [ -f RLBFILES/install/refind/banner.jpg ]; then
  install -D -m 0644 RLBFILES/install/refind/banner.jpg ${BDIR}/shell/install/banner.jpg
fi
