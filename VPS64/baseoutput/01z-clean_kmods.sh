#!/bin/bash

source ../spec.sh
source ./module_spec.sh

DIR="${BDIR}/fskmods"
rm -rf ${DIR}
mkdir ${DIR}

PKG="000-kmods-${KERNVERS}.xzm"
echo "Exploding ${PKG} ..."
xzm2dir ${PKG} ${DIR} >/dev/null

# SAVE SOME SPACE

rm -rf ${DIR}/lib/modules/*/kernel/drivers/ata/acard-ahci.ko
rm -rf ${DIR}/lib/modules/*/kernel/drivers/ata/pata_*.ko
rm -rf ${DIR}/lib/modules/*/kernel/drivers/ata/pdc_*.ko
rm -rf ${DIR}/lib/modules/*/kernel/drivers/ata/sata_*.ko

rm -rf ${DIR}/lib/modules/*/kernel/drivers/bcma

# rm -rf ${DIR}/lib/modules/*/kernel/drivers/char/tpm
rm -rf ${DIR}/lib/modules/*/kernel/drivers/char/xillybus

rm -rf ${DIR}/lib/modules/*/kernel/drivers/cpufreq/powernow-k8.ko

rm -rf ${DIR}/lib/modules/*/kernel/drivers/char/ipmi
rm -rf ${DIR}/lib/modules/*/kernel/drivers/char/nvram.ko
rm -rf ${DIR}/lib/modules/*/kernel/drivers/char/raw.ko

rm -rf ${DIR}/lib/modules/*/kernel/drivers/edac

rm -rf ${DIR}/lib/modules/*/kernel/drivers/firewire

rm -rf ${DIR}/lib/modules/*/kernel/drivers/gpu/drm/amd
rm -rf ${DIR}/lib/modules/*/kernel/drivers/gpu/drm/ast
rm -rf ${DIR}/lib/modules/*/kernel/drivers/gpu/drm/gma500
rm -rf ${DIR}/lib/modules/*/kernel/drivers/gpu/drm/mgag200
rm -rf ${DIR}/lib/modules/*/kernel/drivers/gpu/drm/nouveau
rm -rf ${DIR}/lib/modules/*/kernel/drivers/gpu/drm/radeon
rm -rf ${DIR}/lib/modules/*/kernel/drivers/gpu/drm/vmwgfx

pushd ${DIR}/lib/modules/*/kernel/drivers
tar cf media.tar media/mc media/usb/uvc media/v4l2-core
rm -rf media; tar xvf media.tar; rm media.tar
popd

rm -rf ${DIR}/lib/modules/*/kernel/drivers/mtd

rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/can

rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/dsa

pushd ${DIR}/lib/modules/*/kernel/drivers/net
tar cf ethernet.tar ethernet/8390 ethernet/amd ethernet/intel ethernet/realtek
rm -rf ethernet; tar xvf ethernet.tar; rm ethernet.tar
popd

rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/fddi

rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/fjes

rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/geneve.ko
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/gtp.ko

rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/hamradio

rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/irda

rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ppp

rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/wimax

pushd ${DIR}/lib/modules/*/kernel/drivers
tar cf mfd.tar mfd/lpc_ich.ko
rm -rf mfd; tar xvf mfd.tar; rm mfd.tar
popd

rm -rf ${DIR}/lib/modules/*/kernel/drivers/nfc

rm -rf ${DIR}/lib/modules/*/kernel/drivers/nvdimm

rm -rf ${DIR}/lib/modules/*/kernel/drivers/pcmcia

rm -rf ${DIR}/lib/modules/*/kernel/drivers/platform/chrome

rm -rf ${DIR}/lib/modules/*/kernel/drivers/regulator

rm -rf ${DIR}/lib/modules/*/kernel/drivers/spi

rm -rf ${DIR}/lib/modules/*/kernel/drivers/staging/irda

rm -rf ${DIR}/lib/modules/*/kernel/drivers/video/fbdev/matrox

rm -rf ${DIR}/lib/modules/*/kernel/net/irda
rm -rf ${DIR}/lib/modules/*/kernel/net/nfc
rm -rf ${DIR}/lib/modules/*/kernel/net/openvswitch
rm -rf ${DIR}/lib/modules/*/kernel/net/phonet
rm -rf ${DIR}/lib/modules/*/kernel/net/vmw_vsock
rm -rf ${DIR}/lib/modules/*/kernel/net/xfrm

pushd ${DIR}/lib/modules/*/kernel
tar cf sound.tar sound/*.ko sound/core sound/drivers/snd-*.ko sound/hda sound/pci/ac97 sound/pci/hda sound/usb/snd-usb-audio.ko
rm -rf sound; tar xvf sound.tar; rm sound.tar
rm -r sound/core/seq
rm sound/drivers/{snd-mtpav.ko,snd-virmidi.ko}
popd

rm ${PKG}
echo "Repacking ${PKG} ..."
dir2xzm ${DIR} ${PKG} >/dev/null
rm -rf ${DIR}
