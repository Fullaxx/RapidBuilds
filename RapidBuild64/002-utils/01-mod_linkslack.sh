#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f *.txz *.xzm

if [ "${INCKERNELFIRMWARE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/kernel-firmware-*.txz
fi

if [ "${INCBTRFSPROGS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/btrfs-progs-*.txz
fi

if [ "${INCCPIO}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/cpio-*.txz
fi

if [ "${INCCPUFREQUTILS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/cpufrequtils-*.txz
fi

if [ "${INCCRYPTSETUP}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/cryptsetup-*.txz
fi

if [ "${INCDCRON}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/dcron-*.txz
fi

if [ "${INCDOSFSTOOLS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/dosfstools-*.txz
fi

if [ "${INCFLOPPY}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/floppy-*.txz
fi

if [ "${INCHDPARM}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/hdparm-*.txz
fi

if [ "${INCINFOZIP}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/infozip-*.txz
fi

if [ "${INCINOTIFYTOOLS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/inotify-tools-*.txz
fi

if [ "${INCLOGROTATE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/logrotate-*.txz
fi

if [ "${INCLBZIPTWO}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/lbzip2-*.txz
fi

if [ "${INCLRZIP}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/lrzip-*.txz
fi

if [ "${INCMCELOG}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/mcelog-*.txz
fi

if [ "${INCMDADM}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/mdadm-*.txz
fi

if [ "${INCMINICOM}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/minicom-*.txz
fi

if [ "${INCNCOMPRESS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/ncompress-*.txz
fi

if [ "${INCNTFSTHREEG}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/ntfs-3g-*.txz
fi

if [ "${INCPATCH}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/patch-*.txz
fi

if [ "${INCPKGTOOLS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/pkgtools-*.txz
fi

if [ "${INCPLZIP}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/plzip-*.txz
fi

if [ "${INCSDPARM}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/sdparm-*.txz
fi

if [ "${INCSHARUTILS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/sharutils-*.txz
fi

if [ "${INCMLOCATE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/mlocate-*.txz
fi

if [ "${INCSMARTMONTOOLS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/smartmontools-*.txz
fi

if [ "${INCUSBMODESWITCH}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/usb_modeswitch-*.txz
fi

if [ "${INCUSBUTILS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/usbutils-*.txz
fi

###########################################################

if [ "${INCDCTHREEDD}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/dc3dd-*.txz
fi

if [ "${INCDDRESCUE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/ddrescue-*.txz
fi

if [ "${INCDIFFUTILS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/diffutils-*.txz
fi

if [ "${INCDVDPLUSRWTOOLS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/dvd+rw-tools-*.txz
fi

if [ "${INCGROFF}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/groff-*.txz
fi
if [ "${INCJOE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/joe-*.txz
fi

if [ "${INCLMSENSORS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/lm_sensors-*.txz
fi

if [ "${INCMANPAGES}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/man-db-*.txz
  ln -s ${SLACKPKGDIR}/ap/man-pages-*.txz
fi

if [ "${INCMIDNIGHTCOMMANDER}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/mc-*.txz
fi

if [ "${INCMPGONETWOTHREE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/mpg123-*.txz
fi

if [ "${INCRZIP}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/rzip-*.txz
fi

if [ "${INCPMUTILS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/pm-utils-*.txz
fi

if [ "${INCSYSSTAT}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/sysstat-*.txz
fi

###########################################################

if [ "${INCNETFILTER}" == "Y" ]; then
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

  ln -s ${SLACKPKGDIR}/n/nftables-*.txz
  ln -s ${SLACKPKGDIR}/n/libnftnl-*.txz
fi

if [ "${INCBRIDGEUTILS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/bridge-utils-*.txz
fi

if [ "${INCDNSMASQ}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/dnsmasq-*.txz
fi

if [ "${INCEBTABLES}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/ebtables-*.txz
fi

if [ "${INCETHTOOL}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/ethtool-*.txz
fi

if [ "${INCIFTOP}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/iftop-*.txz
fi

if [ "${INCIPTRAFNG}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/iptraf-ng-*.txz
fi

if [ "${INCGNUPG}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/gnupg-*.txz
fi

if [ "${INCGNUPGTWO}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/gnupg2-*.txz
  ln -s ${SLACKPKGDIR}/n/npth-*.txz
  ln -s ${SLACKPKGDIR}/n/libksba-*.txz
fi

if [ "${INCLYNX}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/lynx-*.txz
fi

if [ "${INCMCABBER}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/mcabber-*.txz
fi

if [ "${INCMTR}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/mtr-*.txz
fi

if [ "${INCNETCAT}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/nc-*.txz
fi

if [ "${INCNETWORKMANAGER}" == "Y" ]; then
# libproxy wants NetworkManager
  ln -s ${SLACKPKGDIR}/n/NetworkManager-*.txz
fi

if [ "${INCNETKITFTP}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/netkit-ftp-*.txz
fi

if [ "${INCNMAP}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/nmap-*.txz
fi

if [ "${INCOPENVPN}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/openvpn-*.txz
fi

if [ "${INCPPP}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/ppp-*.txz
fi

if [ "${INCSSHFS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/sshfs-*.txz
fi

if [ "${INCSTUNNEL}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/stunnel-*.txz
fi

if [ "${INCTCPDUMP}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/tcpdump-*.txz
fi

if [ "${INCTELNET}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/telnet-*.txz
fi

if [ "${INCTFTPHPA}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/tftp-hpa-*.txz
fi

if [ "${INCTRACEROUTE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/traceroute-*.txz
fi

if [ "${INCVLAN}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/vlan-*.txz
fi

###########################################################

# Don't you want to burn a RapidLinux LiveCD?
ln -s ${SLACKPKGDIR}/ap/cdrtools-*.txz

ln -s ${SLACKPKGDIR}/ap/sqlite-*.txz
ln -s ${SLACKPKGDIR}/ap/sudo-*.txz

# I forgot why this is here
ln -s ${SLACKPKGDIR}/d/libtool-*.txz

ln -s ${SLACKPKGDIR}/n/curl-*.txz
ln -s ${SLACKPKGDIR}/n/rsync-*.txz
ln -s ${SLACKPKGDIR}/n/wget-*.txz
