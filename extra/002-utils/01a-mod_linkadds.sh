#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCACPI}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/acpi/acpi-1.7-${ARCH}-bksrc1.xzm"
fi

if [ "${INCATOP}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/atop/atop-2.3.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCBINDTOOLS}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/bindtools/bindtools-9.16.8-${ARCH}-2.xzm"
fi

if [ "${INCCALC}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/calc/calc-2.12.6.5-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCOLORTAIL}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/colortail/colortail-0.3.3-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCORKSCREW}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/corkscrew/corkscrew-2.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCURLFTPFS}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/curlftpfs/curlftpfs-0.9.2-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCURLLOADER}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/curl-loader/curl-loader-0.56-${ARCH}-bksrc1.xzm"
fi

if [ "${INCDAVFSTWO}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/davfs2/davfs2-1.5.5-${ARCH}-bksrc1.xzm"
fi

if [ "${INCDOSTWOUNIX}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/dos2unix/dos2unix-7.4.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCEXFAT}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/exfat/fuse-exfat-1.3.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/exfat/exfat-utils-1.3.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCEXTUNDELETE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/extundelete/extundelete-0.2.4-${ARCH}-bksrc1.xzm"
fi

if [ "${INCFLITE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/flite/flite-1.4-${ARCH}-bksrc1.xzm"
fi

if [ "${INCHEXYL}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/hexyl/hexyl-0.5.0-${ARCH}-1.xzm"
fi

if [ "${INCHPINGTHREE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/hping3/hping3-20051105-${ARCH}-bksrc1.xzm"
fi

if [ "${INCIOPING}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/ioping/ioping-1.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCIOTOP}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/iotop/iotop-20181016-${ARCH}-bksrc1.xzm"
fi

if [ "${INCIPERFTWO}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/iperf/iperf-2.0.12-${ARCH}-bksrc1.xzm"
fi

if [ "${INCIPERFTHREE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/iperf/iperf-3.6-${ARCH}-bksrc1.xzm"
fi

if [ "${INCIPMITOOL}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/ipmitool/ipmitool-20181113-${ARCH}-bksrc1.xzm"
fi

if [ "${INCLIBMAXMINDDB}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/geoipdat/geoipdat-190320-noarch-1.xzm"
  linkpackage "${PACKAGESDIR}/libmaxminddb/libmaxminddb-1.3.2-${ARCH}-bksrc1.xzm"
fi

if [ "${INCLOOPAESSETUP}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/loop-aes-losetup/loop-aes-losetup-2.30.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCMOSH}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/mosh/mosh-1.3.2-${ARCH}-bksrc1.xzm"
fi

if [ "${INCNBD}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/nbd/nbd-3.20-${ARCH}-bksrc1.xzm"
fi

if [ "${INCNMON}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/nmon/nmon-16m-${ARCH}-bksrc1.xzm"
fi

if [ "${INCNUMACTL}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/numactl/numactl-2.0.11-${ARCH}-bksrc1.xzm"
fi

if [ "${INCNUMAD}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/numad/numad-20181024-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPROTOBUF}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/protobuf/protobuf-java-3.12.4-noarch-1.xzm"
  linkpackage "${PACKAGESDIR}/protobuf/protobuf-3.12.4-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPROTOBUFC}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/protobuf/protobuf-c-1.3.3-${ARCH}-bksrc2.xzm"
fi

if [ "${INCRASDAEMON}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/rasdaemon/rasdaemon-0.6.6-${ARCH}-bksrc1.xzm"
fi

if [ "${INCSEVENZIP}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/7z/7z-20210315-${ARCH}-bksrc1.xzm"
fi

if [ "${INCTWEAK}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/tweak/tweak-3.02-${ARCH}-bksrc1.xzm"
fi

if [ "${INCUDFTOOLS}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/udftools/udftools-20210104-${ARCH}-bksrc1.xzm"
fi

if [ "${INCXNBD}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/xnbd/xnbd-0.4.0-${ARCH}-bksrc1.xzm"
fi
