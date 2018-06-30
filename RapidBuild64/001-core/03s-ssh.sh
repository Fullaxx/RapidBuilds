#!/bin/bash

source ../spec.sh
source ./module_spec.sh

PATCHESDIR="RLBFILES/patches"
if [ ! -e ${PATCHESDIR}  ]; then
  echo "patches are missing..."
  exit 1
fi

PATCHFILE="${PATCHESDIR}/rc.sshd.diff"
if [ -f ${DIR}/etc/rc.d/rc.sshd -a -r ${PATCHFILE} ]; then
  patch ${DIR}/etc/rc.d/rc.sshd < ${PATCHFILE}
fi

# SSHD server config defaults
if [ -f ${DIR}/etc/ssh/sshd_config ]; then
  sed -e 's/#Protocol 2/Protocol 2\n#Ciphers aes256-ctr,arcfour256\n#MACs hmac-sha2-512,hmac-sha2-256,hmac-sha1,hmac-ripemd160/' -i ${DIR}/etc/ssh/sshd_config
  sed -e 's/#PermitRootLogin prohibit-password/#PermitRootLogin prohibit-password\nPermitRootLogin yes/' -i ${DIR}/etc/ssh/sshd_config
  sed -e 's/#X11Forwarding no/X11Forwarding yes/' -i ${DIR}/etc/ssh/sshd_config
  sed -e 's/#Compression delayed/Compression no/' -i ${DIR}/etc/ssh/sshd_config
fi

# SSH client config defaults
if [ -f ${DIR}/etc/ssh/ssh_config ]; then
  echo >> ${DIR}/etc/ssh/ssh_config
  echo "Protocol 2" >> ${DIR}/etc/ssh/ssh_config
  #echo "#Ciphers aes256-ctr,arcfour256" >> ${DIR}/etc/ssh/ssh_config
  echo "#Ciphers aes256-ctr" >> ${DIR}/etc/ssh/ssh_config
  echo "#MACs hmac-sha2-512,hmac-sha2-256,hmac-sha1,hmac-ripemd160" >> ${DIR}/etc/ssh/ssh_config
  # echo "Compression no" >> ${DIR}/etc/ssh/ssh_config (this is default)
  echo "ForwardX11 yes" >> ${DIR}/etc/ssh/ssh_config
  echo "ForwardX11Trusted yes" >> ${DIR}/etc/ssh/ssh_config
  echo "#ServerAliveInterval 20" >> ${DIR}/etc/ssh/ssh_config
  echo "#ServerAliveCountMax 3" >> ${DIR}/etc/ssh/ssh_config
  # echo "#ProxyCommand corkscrew squid.proxy.org 80 %h %p" >> ${DIR}/etc/ssh/ssh_config
fi
