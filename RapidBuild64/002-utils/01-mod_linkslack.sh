#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f *.txz *.xzm

if [ "${INCKERNELFIRMWARE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/kernel-firmware-*.txz
fi

if [ "${INCBTRFSPROGS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/btrfs-progs-*.txz
fi

if [ "${INCCPIO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/cpio-*.txz
fi

if [ "${INCCPUFREQUTILS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/cpufrequtils-*.txz
fi

if [ "${INCCRYPTSETUP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/cryptsetup-*.txz
fi

if [ "${INCDCRON}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/dcron-*.txz
fi

if [ "${INCEXFATPROGS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a//exfatprogs-*.txz
fi

if [ "${INCFLOPPY}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/floppy-*.txz
fi

if [ "${INCFTWOFSTOOLS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/f2fs-tools-*.txz
fi

if [ "${INCHAVEGED}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/haveged-*.txz
fi

if [ "${INCHDPARM}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/hdparm-*.txz
fi

if [ "${INCINFOZIP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/infozip-*.txz
fi

if [ "${INCINOTIFYTOOLS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/inotify-tools-*.txz
fi

if [ "${INCLOGROTATE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/logrotate-*.txz
fi

if [ "${INCLBZIPTWO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/lbzip2-*.txz
fi

if [ "${INCLRZIP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/lrzip-*.txz
fi

if [ "${INCLZIP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/lzip-*.txz
fi

if [ "${INCMCELOG}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/mcelog-*.txz
fi

if [ "${INCMDADM}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/mdadm-*.txz
fi

if [ "${INCMINICOM}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/minicom-*.txz
fi

if [ "${INCMLOCATE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/mlocate-*.txz
fi

if [ "${INCNCOMPRESS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/ncompress-*.txz
fi

if [ "${INCNVI}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/nvi-*.txz
fi

if [ "${INCNTFSTHREEG}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/ntfs-3g-*.txz
fi

if [ "${INCPATCH}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/patch-*.txz
fi

if [ "${INCPKGTOOLS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/pkgtools-*.txz
fi

if [ "${INCPLZIP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/plzip-*.txz
fi

if [ "${INCSDPARM}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/sdparm-*.txz
fi

if [ "${INCSHARUTILS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/sharutils-*.txz
fi

if [ "${INCSMARTMONTOOLS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/smartmontools-*.txz
fi

if [ "${INCTCSH}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/tcsh-*.txz
fi

if [ "${INCUSBMODESWITCH}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/usb_modeswitch-*.txz
fi

if [ "${INCUSBUTILS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/usbutils-*.txz
fi

if [ "${INCZEROFREE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/zerofree-*.txz
fi

###########################################################

if [ "${INCCUPS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/cups-*.txz
fi

if [ "${INCDCTHREEDD}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/dc3dd-*.txz
fi

if [ "${INCDDRESCUE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/ddrescue-*.txz
fi

if [ "${INCDIFFUTILS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/diffutils-*.txz
fi

if [ "${INCDMIDECODE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/dmidecode-*.txz
fi

if [ "${INCDVDPLUSRWTOOLS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/dvd+rw-tools-*.txz
fi

if [ "${INCGROFF}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/groff-*.txz
fi

if [ "${INCINXI}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/inxi-*.txz
fi

if [ "${INCJOE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/joe-*.txz
fi

if [ "${INCLMSENSORS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/lm_sensors-*.txz
fi

if [ "${INCMANPAGES}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/man-db-*.txz
  linkpackage ${SLACKPKGDIR}/ap/man-pages-*.txz
fi

if [ "${INCMIDNIGHTCOMMANDER}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/mc-*.txz
fi

if [ "${INCMOC}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/moc-*.txz
fi

if [ "${INCMOST}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/most-*.txz
fi

if [ "${INCMPGONETWOTHREE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/mpg123-*.txz
fi

if [ "${INCNEOFETCH}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/neofetch-*.txz
fi

if [ "${INCNVMECLI}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/nvme-cli-*.txz
fi

if [ "${INCPOWERTOP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/powertop-*.txz
fi

if [ "${INCRZIP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/rzip-*.txz
fi

if [ "${INCSCIM}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/sc-im-*.txz
fi

if [ "${INCSLACKPKG}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/slackpkg-*.txz
fi

if [ "${INCSQUASHFSTOOLS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/squashfs-tools-*.txz
fi

if [ "${INCSYSSTAT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/sysstat-*.txz
fi

if [ "${INCTERMINUSFONT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/terminus-font-*.txz
fi

if [ "${INCTMUX}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/tmux-*.txz
fi

if [ "${INCUNDERVOLT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/undervolt-*.txz
fi

###########################################################

if [ "${INCGIT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/git-*.txz
fi

if [ "${INCTIDYHTMLFIVE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/tidy-html5-*.txz
fi

if [ "${INCNETFILTER}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/conntrack-tools-*.txz
# linkpackage ${SLACKPKGDIR}/n/ipset-*.txz
  linkpackage ${SLACKPKGDIR}/n/iptables-*.txz
  linkpackage ${SLACKPKGDIR}/n/libnetfilter_acct-*.txz
  linkpackage ${SLACKPKGDIR}/n/libnetfilter_conntrack-*.txz
  linkpackage ${SLACKPKGDIR}/n/libnetfilter_cthelper-*.txz
  linkpackage ${SLACKPKGDIR}/n/libnetfilter_cttimeout-*.txz
# linkpackage ${SLACKPKGDIR}/n/libnetfilter_log-*.txz
  linkpackage ${SLACKPKGDIR}/n/libnetfilter_queue-*.txz
  linkpackage ${SLACKPKGDIR}/n/libnfnetlink-*.txz
  linkpackage ${SLACKPKGDIR}/n/nfacct-*.txz
# linkpackage ${SLACKPKGDIR}/n/ulogd-*.txz

  linkpackage ${SLACKPKGDIR}/n/nftables-*.txz
  linkpackage ${SLACKPKGDIR}/n/libnftnl-*.txz
fi

if [ "${INCBRIDGEUTILS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/bridge-utils-*.txz
fi

if [ "${INCEBTABLES}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/ebtables-*.txz
fi

if [ "${INCEPICFIVE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/epic5-*.txz
fi

if [ "${INCETHTOOL}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/ethtool-*.txz
fi

if [ "${INCIFTOP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/iftop-*.txz
fi

if [ "${INCIPTRAFNG}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/iptraf-ng-*.txz
fi

if [ "${INCGNUPG}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/gnupg-*.txz
fi

if [ "${INCGNUPGTWO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/gnupg2-*.txz
  linkpackage ${SLACKPKGDIR}/n/npth-*.txz
  linkpackage ${SLACKPKGDIR}/n/libksba-*.txz
fi

if [ "${INCIRSSI}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/irssi-*.txz
fi

if [ "${INCLYNX}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/lynx-*.txz
fi

if [ "${INCMCABBER}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/mcabber-*.txz
fi

if [ "${INCMTR}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/mtr-*.txz
fi

if [ "${INCNETCAT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/nc-*.txz
fi

if [ "${INCNETPIPES}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/netpipes-*.txz
fi

if [ "${INCNETWORKMANAGER}" == "Y" ]; then
# libproxy wants NetworkManager
  linkpackage ${SLACKPKGDIR}/n/NetworkManager-*.txz
fi

if [ "${INCNETKITFTP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/netkit-ftp-*.txz
fi

if [ "${INCNMAP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/nmap-*.txz
fi

if [ "${INCOPENVPN}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/openvpn-*.txz
fi

if [ "${INCPPP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/ppp-*.txz
fi

if [ "${INCSOCAT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/socat-*.txz
fi

if [ "${INCSSHFS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/sshfs-*.txz
fi

if [ "${INCSTUNNEL}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/stunnel-*.txz
fi

if [ "${INCTCPDUMP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/tcpdump-*.txz
fi

if [ "${INCTELNET}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/telnet-*.txz
fi

if [ "${INCTFTPHPA}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/tftp-hpa-*.txz
fi

if [ "${INCTRACEROUTE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/traceroute-*.txz
fi

if [ "${INCVLAN}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/vlan-*.txz
fi

###########################################################

# Don't you want to burn a RapidLinux LiveCD?
linkpackage ${SLACKPKGDIR}/ap/cdrtools-*.txz

linkpackage ${SLACKPKGDIR}/ap/sqlite-*.txz
linkpackage ${SLACKPKGDIR}/ap/sudo-*.txz

linkpackage ${SLACKPKGDIR}/n/curl-*.txz
linkpackage ${SLACKPKGDIR}/n/rsync-*.txz
linkpackage ${SLACKPKGDIR}/n/wget-*.txz
