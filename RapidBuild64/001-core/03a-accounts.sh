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
echo "ntop:x:212:212:ntop:/:/bin/false" >> ${DIR}/etc/passwd
echo "ntop:x:212:" >> ${DIR}/etc/group
echo "avahi:x:214:214:avahi:/:/bin/false" >> ${DIR}/etc/passwd
echo "avahi:x:214:" >> ${DIR}/etc/group
echo "vboxadd:x:215:215:vboxadd:/:/bin/false" >> ${DIR}/etc/passwd
echo "vboxusers:x:215:" >> ${DIR}/etc/group
echo "pulse:x:216:216:pulse:/:/bin/false" >> ${DIR}/etc/passwd
echo "pulse:x:216:" >> ${DIR}/etc/group
echo "kvm:x:221:" >> ${DIR}/etc/group
echo "thttpd:x:227:227:thttpd:/:/bin/false" >> ${DIR}/etc/passwd
echo "thttpd:x:227:" >> ${DIR}/etc/group
echo "davfs2:x:230:230:davfs2:/:/bin/false" >> ${DIR}/etc/passwd
echo "davfs2:x:230:" >> ${DIR}/etc/group
echo "vboxweb:x:240:215:vboxweb:/:/bin/false" >> ${DIR}/etc/passwd
echo "docker:x:281:" >> ${DIR}/etc/group
echo "openldap:x:330:330:openldap:/:/bin/false" >> ${DIR}/etc/passwd
echo "openldap:x:330:" >> ${DIR}/etc/group
