#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f *.txz *.xzm

linkpackage ${SLACKPKGDIR}/a/aaa_base-*.txz
linkpackage ${SLACKPKGDIR}/a/aaa_libraries-*.txz
linkpackage ${SLACKPKGDIR}/a/aaa_terminfo-*.txz
linkpackage ${SLACKPKGDIR}/a/acl-*.txz
linkpackage ${SLACKPKGDIR}/a/acpid-*.txz
linkpackage ${SLACKPKGDIR}/a/attr-*.txz
linkpackage ${SLACKPKGDIR}/a/bash-*.txz
linkpackage ${SLACKPKGDIR}/a/bin-*.txz
linkpackage ${SLACKPKGDIR}/a/bzip2-*.txz
linkpackage ${SLACKPKGDIR}/a/cracklib-*.txz #pam needs cracklib
linkpackage ${SLACKPKGDIR}/a/coreutils-*.txz
linkpackage ${SLACKPKGDIR}/a/dbus-*.txz
linkpackage ${SLACKPKGDIR}/a/dialog-*.txz
linkpackage ${SLACKPKGDIR}/a/dosfstools-*.txz
linkpackage ${SLACKPKGDIR}/a/e2fsprogs-*.txz
linkpackage ${SLACKPKGDIR}/a/elogind-*.txz
linkpackage ${SLACKPKGDIR}/a/etc-*.txz
linkpackage ${SLACKPKGDIR}/a/file-*.txz
linkpackage ${SLACKPKGDIR}/a/findutils-*.txz
linkpackage ${SLACKPKGDIR}/a/gawk-*.txz
linkpackage ${SLACKPKGDIR}/a/glibc-zoneinfo-*.txz
linkpackage ${SLACKPKGDIR}/a/gpm-*.txz
linkpackage ${SLACKPKGDIR}/a/gptfdisk-*.txz
linkpackage ${SLACKPKGDIR}/a/grep-*.txz
linkpackage ${SLACKPKGDIR}/a/grub-*.txz
linkpackage ${SLACKPKGDIR}/a/gzip-*.txz
linkpackage ${SLACKPKGDIR}/a/hostname-*.txz
linkpackage ${SLACKPKGDIR}/a/kbd-*.txz
linkpackage ${SLACKPKGDIR}/a/kmod-*.txz
linkpackage ${SLACKPKGDIR}/a/less-*.txz
linkpackage ${SLACKPKGDIR}/a/libpwquality-*.txz
linkpackage ${SLACKPKGDIR}/a/lvm2-*.txz

# Thu May 16 02:31:40 UTC 2024 bcachefs-tools added
linkpackage ${SLACKPKGDIR}/a/bcachefs-tools-*.txz
linkpackage ${SLACKPKGDIR}/l/libsodium-*.txz
linkpackage ${SLACKPKGDIR}/l/lz4-*.txz

# LVM2 now requires libnvme, liburing, json-c (may as well include nvme-cli also)
linkpackage ${SLACKPKGDIR}/ap/nvme-cli-*.txz
linkpackage ${SLACKPKGDIR}/l/libnvme-*.txz
linkpackage ${SLACKPKGDIR}/l/liburing-*.txz
linkpackage ${SLACKPKGDIR}/l/json-c-*.txz

# Wed Mar 8 20:26:54 UTC 2023
# Slackware switched to openssl-3.x.x
# This is here for temporary backward compatibility
# Remove this when full recompilation succeeds
# linkpackage ${SLACKPKGDIR}/a/openssl11-solibs-*.txz

linkpackage ${SLACKPKGDIR}/a/openssl-solibs-*.txz
linkpackage ${SLACKPKGDIR}/a/os-prober-*.txz
linkpackage ${SLACKPKGDIR}/a/pam-1.?.?-*.txz
linkpackage ${SLACKPKGDIR}/a/pciutils-*.txz
linkpackage ${SLACKPKGDIR}/a/procps-*.txz
linkpackage ${SLACKPKGDIR}/a/sed-*.txz
linkpackage ${SLACKPKGDIR}/a/shadow-*.txz
linkpackage ${SLACKPKGDIR}/a/sysfsutils-*.txz
linkpackage ${SLACKPKGDIR}/a/sysklogd-*.txz
linkpackage ${SLACKPKGDIR}/a/sysvinit-?.*.txz
linkpackage ${SLACKPKGDIR}/a/sysvinit-functions-*.txz
linkpackage ${SLACKPKGDIR}/a/sysvinit-scripts-*.txz
linkpackage ${SLACKPKGDIR}/a/tar-*.txz
linkpackage ${SLACKPKGDIR}/a/time-*.txz
linkpackage ${SLACKPKGDIR}/a/tree-*.txz
linkpackage ${SLACKPKGDIR}/a/utempter-*.txz
linkpackage ${SLACKPKGDIR}/a/util-linux-*.txz
linkpackage ${SLACKPKGDIR}/a/which-*.txz
linkpackage ${SLACKPKGDIR}/a/xz-*.txz

linkpackage ${SLACKPKGDIR}/a/eudev-*.txz
linkpackage ${SLACKPKGDIR}/l/libffi-*.txz

# file needs lzlib
linkpackage ${SLACKPKGDIR}/a/lzlib-*.txz

linkpackage ${SLACKPKGDIR}/a/reiserfsprogs-*.txz
# xfsprogs needs userspace-rcu
linkpackage ${SLACKPKGDIR}/a/userspace-rcu-*.txz
linkpackage ${SLACKPKGDIR}/a/xfsprogs-*.txz
linkpackage ${SLACKPKGDIR}/a/inih-*.txz
linkpackage ${SLACKPKGDIR}/ap/xfsdump-*.txz

linkpackage ${SLACKPKGDIR}/ap/htop-*.txz
linkpackage ${SLACKPKGDIR}/ap/lsof-*.txz
linkpackage ${SLACKPKGDIR}/ap/lsscsi-*.txz
linkpackage ${SLACKPKGDIR}/ap/nano-*.txz
linkpackage ${SLACKPKGDIR}/ap/screen-*.txz

# req'd for NTP, and others
linkpackage ${SLACKPKGDIR}/l/libedit-*.txz
linkpackage ${SLACKPKGDIR}/l/libevent-*.txz

# libcap appears unnecessary when aaa_elflibs is installed
# linkpackage ${SLACKPKGDIR}/l/libcap-*.txz

# setpriv (from util-linux-2.36.1) needs libcap-ng
linkpackage ${SLACKPKGDIR}/l/libcap-ng-*.txz

linkpackage ${SLACKPKGDIR}/l/libseccomp-*.txz

linkpackage ${SLACKPKGDIR}/l/glib2-*.txz
linkpackage ${SLACKPKGDIR}/l/glibc-?.*.txz
# linkpackage ${SLACKPKGDIR}/l/glibc-profile-*.txz
# linkpackage ${SLACKPKGDIR}/l/glibc-i18n-*.txz

linkpackage ${SLACKPKGDIR}/l/libssh2-*.txz
linkpackage ${SLACKPKGDIR}/l/mpfr-*.txz	#awk needs libmpfr
linkpackage ${SLACKPKGDIR}/l/gmp-*.txz	#libmpfr needs libgmp
linkpackage ${SLACKPKGDIR}/l/ncurses-*.txz
linkpackage ${SLACKPKGDIR}/l/parted-*.txz
linkpackage ${SLACKPKGDIR}/l/popt-*.txz
linkpackage ${SLACKPKGDIR}/l/readline-*.txz
linkpackage ${SLACKPKGDIR}/l/zlib-*.txz

linkpackage ${SLACKPKGDIR}/n/dhcp-*.txz # For dhclient
linkpackage ${SLACKPKGDIR}/n/dhcpcd-*.txz
linkpackage ${SLACKPKGDIR}/n/iproute2-*.txz
linkpackage ${SLACKPKGDIR}/n/iputils-*.txz
linkpackage ${SLACKPKGDIR}/n/network-scripts-*.txz
linkpackage ${SLACKPKGDIR}/n/net-tools-*.txz
linkpackage ${SLACKPKGDIR}/n/ntp-*.txz
linkpackage ${SLACKPKGDIR}/n/openssh-*.txz
linkpackage ${SLACKPKGDIR}/n/libmnl-*.txz
linkpackage ${SLACKPKGDIR}/n/libtirpc-*.txz #pam needs libtirpc

linkpackage ${SLACKEXTRA}/bash-completion/bash-completion-*.txz

# glibc plugins
linkpackage ${SLACKPKGDIR}/n/nss-mdns-*.txz
linkpackage ${SLACKPKGDIR}/l/libnss_nis-*.txz
