#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCUSBMUXD}" == "Y" ]; then
  echo "usbmux:x:52:83:User for usbmux daemon:/var/empty:/bin/false" >> ${DIR}/etc/passwd
fi

if [ "${INCPOLKIT}" == "Y" ]; then
  echo "polkitd:x:87:87:PolicyKit daemon owner:/var/lib/polkit:/bin/false" >> ${DIR}/etc/passwd
  echo "polkitd:x:87:" >> ${DIR}/etc/group
fi

# https://slackbuilds.org/uid_gid.txt
echo "privoxy:x:206:206:privoxy:/:/bin/false" >> ${DIR}/etc/passwd
echo "privoxy:x:206:" >> ${DIR}/etc/group
echo "lighttpd:x:208:208:lighttpd:/:/bin/false" >> ${DIR}/etc/passwd
echo "lighttpd:x:208:" >> ${DIR}/etc/group
echo "postgres:x:209:209:postgres:/:/bin/false" >> ${DIR}/etc/passwd
echo "postgres:x:209:" >> ${DIR}/etc/group
echo "clamav:x:210:210:clamav:/:/bin/false" >> ${DIR}/etc/passwd
echo "clamav:x:210:" >> ${DIR}/etc/group
echo "kvm:x:221:" >> ${DIR}/etc/group
echo "tomcat:x:232:232:tomcat:/:/bin/false" >> ${DIR}/etc/passwd
echo "tomcat:x:232:" >> ${DIR}/etc/group
echo "docker:x:281:" >> ${DIR}/etc/group
