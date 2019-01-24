#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ -d ${DIR}/etc/lvm -a ! -d ${DIR}/etc/lvm/backup ]; then mkdir ${DIR}/etc/lvm/backup; fi
if [ ! -e ${DIR}/usr/bin/bash ]; then ln -s /bin/bash ${DIR}/usr/bin/bash; fi
if [ ! -e ${DIR}/usr/bin/env ]; then ln -s /bin/env ${DIR}/usr/bin/env; fi
if [ ! -e ${DIR}/usr/bin/tgz2xzm ]; then ln -s txz2xzm ${DIR}/usr/bin/tgz2xzm; fi

# sed -e 's/--noclear //' -i fs/etc/inittab
sed -e '/\/usr\/local\/lib64/d' -i ${DIR}/etc/ld.so.conf
sed -e 's/ENCRYPT_METHOD SHA256/ENCRYPT_METHOD SHA512/' -i ${DIR}/etc/login.defs
sed -e 's/# SHA_CRYPT_MIN_ROUNDS 5000/SHA_CRYPT_MIN_ROUNDS 999999/' -i ${DIR}/etc/login.defs
sed -e 's/# SHA_CRYPT_MAX_ROUNDS 5000/SHA_CRYPT_MAX_ROUNDS 999999/' -i ${DIR}/etc/login.defs

# This will fix Google Chrome from finding libnss3 in /usr/lib64/firefox
sed -e '/include /d' -i ${DIR}/etc/ld.so.conf
echo "include /etc/ld.so.conf.d/*.conf" >> ${DIR}/etc/ld.so.conf
