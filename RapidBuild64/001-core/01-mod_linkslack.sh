#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f *.txz *.xzm

ln -s ${SLACKPKGDIR}/a/aaa_base-*.txz
ln -s ${SLACKPKGDIR}/a/aaa_elflibs-*.txz
ln -s ${SLACKPKGDIR}/a/aaa_terminfo-*.txz
ln -s ${SLACKPKGDIR}/a/acl-*.txz
ln -s ${SLACKPKGDIR}/a/acpid-*.txz
ln -s ${SLACKPKGDIR}/a/attr-*.txz
ln -s ${SLACKPKGDIR}/a/bash-*.txz
ln -s ${SLACKPKGDIR}/a/bin-*.txz
ln -s ${SLACKPKGDIR}/a/bzip2-*.txz
ln -s ${SLACKPKGDIR}/a/coreutils-*.txz
# ln -s ${SLACKPKGDIR}/a/cxxlibs-*.txz removed as of 150425
ln -s ${SLACKPKGDIR}/a/dbus-*.txz
ln -s ${SLACKPKGDIR}/a/dialog-*.txz
ln -s ${SLACKPKGDIR}/a/e2fsprogs-*.txz
ln -s ${SLACKPKGDIR}/a/etc-*.txz
ln -s ${SLACKPKGDIR}/a/file-*.txz
ln -s ${SLACKPKGDIR}/a/findutils-*.txz
ln -s ${SLACKPKGDIR}/a/gawk-*.txz
ln -s ${SLACKPKGDIR}/a/getty-ps-*.txz
# ln -s ${SLACKPKGDIR}/a/glibc-solibs-*.txz  can we get away with this?? - looks like it
ln -s ${SLACKPKGDIR}/a/glibc-zoneinfo-*.txz
ln -s ${SLACKPKGDIR}/a/gpm-*.txz
ln -s ${SLACKPKGDIR}/a/gptfdisk-*.txz
ln -s ${SLACKPKGDIR}/a/grep-*.txz
ln -s ${SLACKPKGDIR}/a/grub-*.txz
ln -s ${SLACKPKGDIR}/a/gzip-*.txz
ln -s ${SLACKPKGDIR}/a/hostname-*.txz
ln -s ${SLACKPKGDIR}/a/kbd-*.txz
ln -s ${SLACKPKGDIR}/a/kmod-*.txz
ln -s ${SLACKPKGDIR}/a/less-*.txz
ln -s ${SLACKPKGDIR}/a/lvm2-*.txz
ln -s ${SLACKPKGDIR}/a/openssl-solibs-*.txz
ln -s ${SLACKPKGDIR}/a/os-prober-*.txz
ln -s ${SLACKPKGDIR}/a/pciutils-*.txz
ln -s ${SLACKPKGDIR}/a/procps-*.txz
ln -s ${SLACKPKGDIR}/a/sed-*.txz
ln -s ${SLACKPKGDIR}/a/shadow-*.txz
ln -s ${SLACKPKGDIR}/a/sysfsutils-*.txz
ln -s ${SLACKPKGDIR}/a/sysklogd-*.txz
ln -s ${SLACKPKGDIR}/a/sysvinit-?.*.txz || exit 1
ln -s ${SLACKPKGDIR}/a/sysvinit-functions-*.txz
ln -s ${SLACKPKGDIR}/a/sysvinit-scripts-*.txz
ln -s ${SLACKPKGDIR}/a/tar-*.txz
ln -s ${SLACKPKGDIR}/a/time-*.txz
ln -s ${SLACKPKGDIR}/a/tree-*.txz
ln -s ${SLACKPKGDIR}/a/utempter-*.txz
ln -s ${SLACKPKGDIR}/a/util-linux-*.txz
ln -s ${SLACKPKGDIR}/a/which-*.txz
ln -s ${SLACKPKGDIR}/a/xz-*.txz

# Replaced udev with eudev
ln -s ${SLACKPKGDIR}/a/eudev-*.txz
ln -s ${SLACKPKGDIR}/l/libffi-*.txz

ln -s ${SLACKPKGDIR}/a/reiserfsprogs-*.txz
ln -s ${SLACKPKGDIR}/a/xfsprogs-*.txz
ln -s ${SLACKPKGDIR}/ap/xfsdump-*.txz

ln -s ${SLACKPKGDIR}/ap/htop-*.txz
ln -s ${SLACKPKGDIR}/ap/lsof-*.txz
ln -s ${SLACKPKGDIR}/ap/lsscsi-*.txz
ln -s ${SLACKPKGDIR}/ap/nano-*.txz
ln -s ${SLACKPKGDIR}/ap/screen-*.txz
ln -s ${SLACKPKGDIR}/ap/squashfs-tools-*.txz

# req'd for NTP, and others
ln -s ${SLACKPKGDIR}/l/libedit-*.txz
ln -s ${SLACKPKGDIR}/l/libevent-*.txz

# libcap appears unnecessary when aaa_elflibs is installed
# ln -s ${SLACKPKGDIR}/l/libcap-*.txz
ln -s ${SLACKPKGDIR}/l/libcap-ng-*.txz

ln -s ${SLACKPKGDIR}/l/glib2-*.txz
ln -s ${SLACKPKGDIR}/l/glibc-?.*.txz || exit 1
# ln -s ${SLACKPKGDIR}/l/glibc-profile-*.txz
# ln -s ${SLACKPKGDIR}/l/glibc-i18n-*.txz

ln -s ${SLACKPKGDIR}/l/libssh2-*.txz
ln -s ${SLACKPKGDIR}/l/lzo-*.txz
ln -s ${SLACKPKGDIR}/l/mpfr-*.txz	#awk needs libmpfr
ln -s ${SLACKPKGDIR}/l/gmp-*.txz	#libmpfr needs libgmp
ln -s ${SLACKPKGDIR}/l/ncurses-*.txz
ln -s ${SLACKPKGDIR}/l/parted-*.txz
ln -s ${SLACKPKGDIR}/l/popt-*.txz
ln -s ${SLACKPKGDIR}/l/readline-*.txz
ln -s ${SLACKPKGDIR}/l/zlib-*.txz

ln -s ${SLACKPKGDIR}/n/dhcp-*.txz # For dhclient
ln -s ${SLACKPKGDIR}/n/dhcpcd-*.txz
ln -s ${SLACKPKGDIR}/n/iproute2-*.txz
ln -s ${SLACKPKGDIR}/n/iputils-*.txz
ln -s ${SLACKPKGDIR}/n/network-scripts-*.txz
ln -s ${SLACKPKGDIR}/n/net-tools-*.txz
ln -s ${SLACKPKGDIR}/n/ntp-*.txz
ln -s ${SLACKPKGDIR}/n/openssh-*.txz
ln -s ${SLACKPKGDIR}/n/libmnl-*.txz

linkmodule ${SLACKEXTRA}/bash-completion/bash-completion-*.txz

# Needed for udisks
#ln -s ${SLACKPKGDIR}/l/libatasmart-*.txz
#rm udisks-*.txz upower-*.txz

# udisks2 is a seperate project
#rm udisks2-*.txz
# NEED to figure out what to do here... maybe ldm?
