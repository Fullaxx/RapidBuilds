#!/bin/bash
# ---------------------------------------------------
# Script to create bootable ISO in Linux
# usage: make_iso.sh [ /tmp/rl.iso ]
# author: Tomas M. <http://www.linux-live.org>
# author: Brett Kuskie <fullaxx@gmail.com>
# ---------------------------------------------------

if [ "$1" = "--help" -o "$1" = "-h" ]; then
  echo "This script will create bootable ISO from files in current directory."
  echo "Current directory must be writable."
  echo "example: $0 /mnt/hda5/rl.iso"
  exit
fi

CDLABEL="RL"
ISONAME=$(readlink -f "$1")

cd $(dirname $0)

if [ "$ISONAME" = "" ]; then
   SUGGEST=$(readlink -f ../../$(basename $(pwd)).iso)
   echo -ne "Target ISO file name [ Hit enter for $SUGGEST ]: "
   read ISONAME
   if [ "$ISONAME" = "" ]; then ISONAME="$SUGGEST"; fi
fi

# From Ubuntu ISO:
# -eltorito-alt-boot -e boot/grub/efi.img -no-emul-boot -isohybrid-gpt-basdat

# EFI bootable CD/DVD components
if [ "${RLUEFIBOOT}" == "REFIND" ]; then
  BOOTISOWITHUEFI="-eltorito-alt-boot -eltorito-platform efi -eltorito-boot EFI/BOOT/bootx64.efi -no-emul-boot"
fi

if [ "${RLUEFIBOOT}" == "GRUB" ]; then
  BOOTISOWITHUEFI="-eltorito-alt-boot -eltorito-platform efi -eltorito-boot boot/grub/efi.img -no-emul-boot"
fi

mkisofs -o "$ISONAME" -v -J -R -D -A "$CDLABEL" -V "$CDLABEL" \
-no-emul-boot -boot-info-table -boot-load-size 4 \
-b boot/isolinux/isolinux.bin -c boot/isolinux/isolinux.boot \
${BOOTISOWITHUEFI} \
../.
