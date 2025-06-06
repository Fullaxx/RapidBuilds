#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCACPI}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/acpi/acpi-1.7-${ARCH}-bksrc1.xzm"
fi

if [ "${INCAG}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/ag/ag-20230321-${ARCH}-bksrc1.xzm"
fi

if [ "${INCARPSCAN}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/arpscan/arp-scan-1.10.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCATOP}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/atop/atop-2.3.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCAXEL}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/axel/axel-2.17.11-${ARCH}-bksrc1.xzm"
fi

if [ "${INCBMON}" == "Y" ]; then
# libconfuse could be moved to 009-xmodlibs if something else needs it
  linkpackage "${PACKAGESDIR}/libconfuse/libconfuse-3.2.2-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/bmon/bmon-4.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCBROOT}" == "Y" ]; then
  linkpackage ${PACKAGESDIR}/broot/broot-1.22.1-${ARCH}-1.xzm
fi

if [ "${INCBTOPPLUSPLUS}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/btopplusplus/btop-1.2.13-${ARCH}-1.xzm"
fi

if [ "${INCBINDTOOLS}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/bindtools/bindtools-9.18.13-${ARCH}-1.xzm"
fi

if [ "${INCCALC}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/calc/calc-2.14.0.14-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCCAT}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/ccat/ccat-1.1.0-${ARCH}-1.xzm"
fi

if [ "${INCCOLORTAIL}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/colortail/colortail-0.3.3-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCORKSCREW}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/corkscrew/corkscrew-2.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCTOP}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/ctop/ctop-0.7.7-${ARCH}-1.xzm"
fi

if [ "${INCCURLFTPFS}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/curlftpfs/curlftpfs-0.9.2-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCURLLOADER}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/curl-loader/curl-loader-0.56-${ARCH}-bksrc2.xzm"
fi

if [ "${INCDARKHTTPD}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/darkhttpd/darkhttpd-1.12-${ARCH}-bksrc1.xzm"
fi

if [ "${INCDAVFSTWO}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/davfs2/davfs2-1.5.5-${ARCH}-bksrc1.xzm"
fi

if [ "${INCDELTA}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/delta/delta-0.15.1-${ARCH}-1.xzm"
fi

if [ "${INCDIVE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/dive/dive-0.11.0-${ARCH}-1.xzm"
fi

if [ "${INCDOSTWOUNIX}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/dos2unix/dos2unix-7.4.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCDRY}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/dry/dry-0.11.1-${ARCH}-1.xzm"
fi

#if [ "${INCFUSEEXFAT}" == "Y" ]; then
#  linkpackage "${PACKAGESDIR}/exfat/fuse-exfat-1.3.0-${ARCH}-bksrc1.xzm"
#  linkpackage "${PACKAGESDIR}/exfat/exfat-utils-1.3.0-${ARCH}-bksrc1.xzm"
#fi

if [ "${INCEXTUNDELETE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/extundelete/extundelete-0.2.4-${ARCH}-bksrc1.xzm"
fi

if [ "${INCFLITE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/flite/flite-1.4-${ARCH}-bksrc1.xzm"
fi

if [ "${INCGPING}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/gping/gping-1.12.0-${ARCH}-1.xzm"
fi

if [ "${INCHEXYL}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/hexyl/hexyl-0.5.0-${ARCH}-1.xzm"
fi

if [ "${INCHPINGTHREE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/hping3/hping3-20051105-${ARCH}-bksrc1.xzm"
fi

if [ "${INCHPNSSH}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/hpnssh/hpnssh-18.3.1-${ARCH}-bksrc1.xzm"
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
  linkpackage "${PACKAGESDIR}/iperf/iperf-3.13-${ARCH}-bksrc1.xzm"
fi

if [ "${INCIPMITOOL}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/ipmitool/ipmitool-20230406-${ARCH}-bksrc1.xzm"
fi

if [ "${INCJQ}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/jq/jq-1.7.1-${ARCH}-1.xzm"
fi

if [ "${INCLAZYDOCKER}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/lazy/lazydocker-0.21.1-${ARCH}-1.xzm"
fi

if [ "${INCLAZYGIT}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/lazy/lazygit-0.40.2-${ARCH}-1.xzm"
fi

if [ "${INCLIBMAXMINDDB}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/geoipdat/geoipdat-230326-noarch-1.xzm"
  linkpackage "${PACKAGESDIR}/libmaxminddb/libmaxminddb-1.7.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCLOOPAESSETUP}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/loop-aes-losetup/loop-aes-losetup-2.30.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCMICRO}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/micro/micro-2.0.11-${ARCH}-1.xzm"
fi

if [ "${INCNBD}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/nbd/nbd-3.26.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCNBDKIT}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/nbdkit/nbdkit-20240426-${ARCH}-bksrc1.xzm"
fi

if [ "${INCNCDU}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/ncdu/ncdu-2.2.1-${ARCH}-1.xzm"
fi

if [ "${INCNLOAD}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/nload/nload-20220919-${ARCH}-bksrc1.xzm"
fi

if [ "${INCNMON}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/nmon/nmon-16m-${ARCH}-bksrc1.xzm"
fi

if [ "${INCNNN}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/nnn/nnn-4.8-${ARCH}-bksrc1.xzm"
fi

if [ "${INCNUMACTL}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/numactl/numactl-2.0.11-${ARCH}-bksrc1.xzm"
fi

if [ "${INCNUMAD}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/numad/numad-20181024-${ARCH}-bksrc1.xzm"
fi

if [ "${INCNVTOP}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/nvtop/nvtop-3.0.2-${ARCH}-1.xzm"
fi

if [ "${INCPV}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/pv/pv-1.6.20-${ARCH}-bksrc1.xzm"
fi

if [ "${INCRASDAEMON}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/rasdaemon/rasdaemon-0.6.6-${ARCH}-bksrc1.xzm"
fi

if [ "${INCSEVENZIP}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/jinfeihan57_p7zip/p7zip-17.04-${ARCH}-bksrc1.xzm"
fi

if [ "${INCTWEAK}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/tweak/tweak-3.02-${ARCH}-bksrc1.xzm"
fi

if [ "${INCUDFTOOLS}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/udftools/udftools-20220324-${ARCH}-bksrc1.xzm"
fi

if [ "${INCWOL}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/wol/wol-20230410-${ARCH}-bksrc1.xzm"
fi

if [ "${INCXNBD}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/xnbd/xnbd-0.4.0-${ARCH}-bksrc1.xzm"
fi
