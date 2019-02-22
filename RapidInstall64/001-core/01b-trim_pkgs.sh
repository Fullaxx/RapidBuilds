#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm iputils-*.txz
# iputils requires libidb2 (ping, arping, tracepath, traceroute6)
# linkpackage ${SLACKPKGDIR}/l/libidn2-*.txz
# libidn2 requires libunistring

rm acl-*.txz
rm attr-*.txz
rm bash-completion-*.txz
rm bin-*.txz
rm dhcp-*.txz
rm dhcpcd-*.txz
rm dialog-*.txz
rm glib2-*.txz
rm gmp-*.txz
rm gpm-*.txz
rm gzip-*.txz
rm htop-*.txz
rm kbd-*.txz
rm libssh2-*.txz
rm mpfr-*.txz
rm ncurses-*.txz
rm openssh-*.txz
rm popt-*.txz
rm reiserfsprogs-*.txz
rm screen-*.txz
rm sysfsutils-*.txz
rm tar-*.txz
rm utempter-*.txz
rm xfsdump-*.txz
rm xfsprogs-*.txz
rm xz-*.txz

# Modules that would have been brought in from 01a-mod_linkadds.sh
rm -f db48libs-*.xzm
rm -f ipmitool-*.xzm
rm -f libdaemon-*.xzm
rm -f loop-aes-losetup-*.xzm
rm -f netplug-*.xzm
rm -f radvd-*.xzm
rm -f seatools-*.xzm
