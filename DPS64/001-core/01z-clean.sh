#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm acpid-*.txz
rm bash-completion-*.txz
rm bzip2-*.txz
rm dbus-*.txz
rm dialog-*.txz
rm e2fsprogs-*.txz
rm gmp-*.txz
rm gpm-*.txz
rm gptfdisk-*.txz
rm grub-*.txz os-prober-*.txz
rm gzip-*.txz
rm htop-*.txz

# rc.inet1 reqs /sbin/ip
# rm iproute2-*.txz

rm iputils-*.txz
rm kbd-*.txz
rm less-*.txz
rm libedit-*.txz

# webdis reqs libevent
# rm libevent-*.txz

rm lsscsi-*.txz
rm lvm2-*.txz
rm mpfr-*.txz
rm nano-*.txz
rm ncurses-*.txz
rm net-tools-*.txz
rm ntp-*.txz
rm openssh-*.txz
rm parted-*.txz
rm pciutils-*.txz
rm readline-*.txz
rm reiserfsprogs-*.txz
rm screen-*.txz
rm sysklogd-*.txz
# rm sysvinit-*.txz (rc.S)
rm tar-*.txz
rm tree-*.txz
rm utempter-*.txz
rm xfsdump-*.txz xfsprogs-*.txz
rm xz-*.txz
rm zlib-*.txz
