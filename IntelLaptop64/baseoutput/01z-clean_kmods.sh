#!/bin/bash

source ../spec.sh
source ./module_spec.sh

DIR="${BDIR}/fskmods"
rm -rf ${DIR}
mkdir ${DIR}

PKG="000-kmods-${KERNVERS}.xzm"
echo "Exploding ${PKG} ..."
xzm2dir ${PKG} ${DIR} >/dev/null || exit 1

# SAVE SOME SPACE

rm -rf ${DIR}/lib/modules/*/kernel/drivers/ata/acard-ahci.ko
rm -rf ${DIR}/lib/modules/*/kernel/drivers/ata/pata_*.ko
rm -rf ${DIR}/lib/modules/*/kernel/drivers/ata/pdc_*.ko
rm -rf ${DIR}/lib/modules/*/kernel/drivers/ata/sata_*.ko

rm -rf ${DIR}/lib/modules/*/kernel/drivers/char/xillybus

rm -rf ${DIR}/lib/modules/*/kernel/drivers/cpufreq/powernow-k8.ko

rm -rf ${DIR}/lib/modules/*/kernel/drivers/firewire

rm -rf ${DIR}/lib/modules/*/kernel/drivers/gpu/drm/amd
rm -rf ${DIR}/lib/modules/*/kernel/drivers/gpu/drm/ast
rm -rf ${DIR}/lib/modules/*/kernel/drivers/gpu/drm/gma500
rm -rf ${DIR}/lib/modules/*/kernel/drivers/gpu/drm/mgag200
rm -rf ${DIR}/lib/modules/*/kernel/drivers/gpu/drm/nouveau
rm -rf ${DIR}/lib/modules/*/kernel/drivers/gpu/drm/radeon
rm -rf ${DIR}/lib/modules/*/kernel/drivers/gpu/drm/vmwgfx

rm -rf ${DIR}/lib/modules/*/kernel/drivers/mtd

rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/can

rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/dsa

rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/3com
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/8390
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/adaptec
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/agere
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/alacritech
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/alteon
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/amd
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/atheros
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/broadcom
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/brocade
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/cadence
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/cavium
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/chelsio
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/cisco
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/dec
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/dlink
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/dnet.ko
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/ec_bhf.ko
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/emulex
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/ethoc.ko
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/fealnx.ko
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/hp
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/huawei
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/jme.ko
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/marvell
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/mellanox
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/micrel
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/myricom
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/natsemi
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/neterion
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/netronome
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/nvidia
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/qlogic
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/qualcomm
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/rdc
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/samsung
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/sfc
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/silan
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/sis
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/smsc
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/stmicro
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/sun
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/synopsys
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/tehuti
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/ti
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/via
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/ethernet/wiznet

rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/fddi

rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/fjes

rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/geneve.ko
rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/gtp.ko

rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/hamradio

rm -rf ${DIR}/lib/modules/*/kernel/drivers/net/wimax

rm -rf ${DIR}/lib/modules/*/kernel/drivers/nfc

rm -rf ${DIR}/lib/modules/*/kernel/drivers/pcmcia

rm -rf ${DIR}/lib/modules/*/kernel/drivers/platform/chrome

rm -rf ${DIR}/lib/modules/*/kernel/drivers/spi
rm -rf ${DIR}/lib/modules/*/kernel/drivers/staging/irda

rm ${PKG}
echo "Repacking ${PKG} ..."
dir2xzm ${DIR} ${PKG} >/dev/null || exit 1
rm -rf ${DIR}
