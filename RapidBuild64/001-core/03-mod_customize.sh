#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# This is a quick hack to fix the /mnt/live/cleanup script
# dash is the slackware replacement for ash
ln -s bash ${DIR}/bin/ash

if [ -d ${DIR}/etc/lvm -a ! -d ${DIR}/etc/lvm/backup ]; then mkdir ${DIR}/etc/lvm/backup; fi
if [ ! -e ${DIR}/usr/bin/bash ]; then ln -s /bin/bash ${DIR}/usr/bin/bash; fi
if [ ! -e ${DIR}/usr/bin/env ]; then ln -s /bin/env ${DIR}/usr/bin/env; fi
if [ ! -e ${DIR}/usr/bin/lzm2dir ]; then ln -s xzm2dir ${DIR}/usr/bin/lzm2dir; fi
if [ ! -e ${DIR}/usr/bin/tgz2xzm ]; then ln -s txz2xzm ${DIR}/usr/bin/tgz2xzm; fi

# sed -e 's/--noclear //' -i fs/etc/inittab
sed -e '/\/usr\/local\/lib64/d' -i ${DIR}/etc/ld.so.conf
sed -e 's/export LESS="-M"/export LESS="-M -r"/' -i ${DIR}/etc/profile
sed -e 's#MANPATH=/usr/local/man:/usr/man#MANPATH=/usr/man#' -i ${DIR}/etc/profile
sed -e 's#/usr/local/bin:/usr/bin:/bin:/usr/games#/usr/bin:/bin#' -i ${DIR}/etc/profile
sed -e 's#PATH=/usr/local/sbin:/usr/sbin:/sbin#PATH=/usr/sbin:/sbin#' -i ${DIR}/etc/profile
sed -e 's#    /usr/sbin/acpid#    sleep 3; /usr/sbin/acpid#' -i ${DIR}/etc/rc.d/rc.acpid
sed -e 's/ENCRYPT_METHOD SHA256/ENCRYPT_METHOD SHA512/' -i ${DIR}/etc/login.defs
sed -e 's/# SHA_CRYPT_MIN_ROUNDS 5000/SHA_CRYPT_MIN_ROUNDS 999999/' -i ${DIR}/etc/login.defs
sed -e 's/# SHA_CRYPT_MAX_ROUNDS 5000/SHA_CRYPT_MAX_ROUNDS 999999/' -i ${DIR}/etc/login.defs

sed -e 's/export LANG=en_US.UTF-8/#export LANG=en_US.UTF-8/g' -i ${DIR}/etc/profile.d/lang.sh
sed -e 's/#export LANG=C/export LANG=C/g' -i ${DIR}/etc/profile.d/lang.sh
