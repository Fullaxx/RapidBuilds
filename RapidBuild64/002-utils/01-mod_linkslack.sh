#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f *.txz *.xzm

if [ "$INCKERNELFIRMWARE" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/kernel-firmware-*.txz
fi

ln -s ${SLACKPKGDIR}/a/btrfs-progs-*.txz
ln -s ${SLACKPKGDIR}/a/cpufrequtils-*.txz
ln -s ${SLACKPKGDIR}/a/cryptsetup-*.txz
ln -s ${SLACKPKGDIR}/a/dcron-*.txz
ln -s ${SLACKPKGDIR}/a/dosfstools-*.txz
ln -s ${SLACKPKGDIR}/a/floppy-*.txz
ln -s ${SLACKPKGDIR}/a/hdparm-*.txz
ln -s ${SLACKPKGDIR}/a/inotify-tools-*.txz
ln -s ${SLACKPKGDIR}/a/mcelog-*.txz
ln -s ${SLACKPKGDIR}/a/mdadm-*.txz
ln -s ${SLACKPKGDIR}/a/minicom-*.txz
ln -s ${SLACKPKGDIR}/a/ntfs-3g-*.txz
ln -s ${SLACKPKGDIR}/a/patch-*.txz
ln -s ${SLACKPKGDIR}/a/pkgtools-*.txz
ln -s ${SLACKPKGDIR}/a/sdparm-*.txz
ln -s ${SLACKPKGDIR}/a/sharutils-*.txz
ln -s ${SLACKPKGDIR}/a/mlocate-*.txz
ln -s ${SLACKPKGDIR}/a/smartmontools-*.txz
ln -s ${SLACKPKGDIR}/a/usb_modeswitch-*.txz
ln -s ${SLACKPKGDIR}/a/usbutils-*.txz

ln -s ${SLACKPKGDIR}/a/cpio-*.txz
ln -s ${SLACKPKGDIR}/a/infozip-*.txz
ln -s ${SLACKPKGDIR}/a/lrzip-*.txz
ln -s ${SLACKPKGDIR}/a/ncompress-*.txz

ln -s ${SLACKPKGDIR}/ap/bc-*.txz
ln -s ${SLACKPKGDIR}/ap/cdrtools-*.txz
ln -s ${SLACKPKGDIR}/ap/dc3dd-*.txz
ln -s ${SLACKPKGDIR}/ap/ddrescue-*.txz
ln -s ${SLACKPKGDIR}/ap/diffutils-*.txz
ln -s ${SLACKPKGDIR}/ap/dvd+rw-tools-*.txz
ln -s ${SLACKPKGDIR}/ap/groff-*.txz
ln -s ${SLACKPKGDIR}/ap/man-db-*.txz
ln -s ${SLACKPKGDIR}/ap/man-pages-*.txz
ln -s ${SLACKPKGDIR}/ap/pm-utils-*.txz
ln -s ${SLACKPKGDIR}/ap/sqlite-*.txz
ln -s ${SLACKPKGDIR}/ap/sudo-*.txz

if [ "$INCMPG123" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/mpg123-*.txz
fi

if [ "$INCSYSSTAT" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/sysstat-*.txz
fi

if [ "$INCLMSENSORS" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/lm_sensors-*.txz
fi

if [ "$INCALSA" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/alsa-utils-*.txz
  ln -s ${SLACKPKGDIR}/l/alsa-lib-*.txz
  ln -s ${SLACKPKGDIR}/l/alsa-oss-*.txz
  ln -s ${SLACKPKGDIR}/l/libsamplerate-*.txz
fi

ln -s ${SLACKPKGDIR}/d/libtool-*.txz

ln -s ${SLACKPKGDIR}/n/conntrack-tools-*.txz
# ln -s ${SLACKPKGDIR}/n/ipset-*.txz
ln -s ${SLACKPKGDIR}/n/iptables-*.txz
ln -s ${SLACKPKGDIR}/n/libnetfilter_acct-*.txz
ln -s ${SLACKPKGDIR}/n/libnetfilter_conntrack-*.txz
ln -s ${SLACKPKGDIR}/n/libnetfilter_cthelper-*.txz
ln -s ${SLACKPKGDIR}/n/libnetfilter_cttimeout-*.txz
# ln -s ${SLACKPKGDIR}/n/libnetfilter_log-*.txz
ln -s ${SLACKPKGDIR}/n/libnetfilter_queue-*.txz
ln -s ${SLACKPKGDIR}/n/libnfnetlink-*.txz
ln -s ${SLACKPKGDIR}/n/nfacct-*.txz
# ln -s ${SLACKPKGDIR}/n/ulogd-*.txz
ln -s ${SLACKPKGDIR}/n/iptraf-ng-*.txz

ln -s ${SLACKPKGDIR}/n/nftables-*.txz
ln -s ${SLACKPKGDIR}/n/libnftnl-*.txz

ln -s ${SLACKPKGDIR}/n/bridge-utils-*.txz
# ln -s ${SLACKPKGDIR}/n/ebtables-*.txz
ln -s ${SLACKPKGDIR}/n/ca-certificates-*.txz
ln -s ${SLACKPKGDIR}/n/curl-*.txz
ln -s ${SLACKPKGDIR}/n/dnsmasq-*.txz
ln -s ${SLACKPKGDIR}/n/ethtool-*.txz
ln -s ${SLACKPKGDIR}/n/iftop-*.txz
ln -s ${SLACKPKGDIR}/n/lynx-*.txz
ln -s ${SLACKPKGDIR}/n/nc-*.txz
ln -s ${SLACKPKGDIR}/n/netkit-ftp-*.txz
ln -s ${SLACKPKGDIR}/n/nmap-*.txz
ln -s ${SLACKPKGDIR}/n/openssl-*.txz
ln -s ${SLACKPKGDIR}/n/openvpn-*.txz
ln -s ${SLACKPKGDIR}/n/ppp-*.txz
ln -s ${SLACKPKGDIR}/n/rsync-*.txz
ln -s ${SLACKPKGDIR}/n/sshfs-*.txz
ln -s ${SLACKPKGDIR}/n/stunnel-*.txz
ln -s ${SLACKPKGDIR}/n/tcpdump-*.txz
ln -s ${SLACKPKGDIR}/n/telnet-*.txz
ln -s ${SLACKPKGDIR}/n/tftp-hpa-*.txz
ln -s ${SLACKPKGDIR}/n/traceroute-*.txz
ln -s ${SLACKPKGDIR}/n/wget-*.txz
ln -s ${SLACKPKGDIR}/n/gnutls-*.txz
ln -s ${SLACKPKGDIR}/n/vlan-*.txz

if [ "${INCGNUPG}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/gnupg-*.txz
fi

if [ "${INCGNUPG2}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/gnupg2-*.txz
  ln -s ${SLACKPKGDIR}/n/npth-*.txz
  ln -s ${SLACKPKGDIR}/n/libksba-*.txz
fi

if [ "${INCGPGME}" == "Y" ]; then
# Samba,mcabber
  ln -s ${SLACKPKGDIR}/n/gpgme-*.txz
fi

if [ "${INCMIDNIGHTCOMMANDER}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/mc-*.txz
fi

if [ "${INCMCABBER}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/mcabber-*.txz
fi

if [ "${INCNETWORKMANAGER}" == "Y" ]; then
# libproxy needs NetworkManager
  ln -s ${SLACKPKGDIR}/n/NetworkManager-*.txz
fi

if [ "${INCLIBNDP}" == "Y" ]; then
# NetworkManager needs libndp
  ln -s ${SLACKPKGDIR}/n/libndp-*.txz
fi

if [ "${INCLOGROTATE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/logrotate-*.txz
fi

if [ "${INCMTR}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/mtr-*.txz
fi
