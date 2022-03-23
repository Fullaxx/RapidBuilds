#!/bin/bash

sed -e 's/,suid,/,nosuid,/g' -i /etc/fstab
sed -e 's/,dev,/,nodev,/g' -i /etc/fstab

sed -e 's@operator:x:11:0:operator:/root:/bin/bash@operator:x:11:0:operator:/root:/bin/false@' -i /etc/passwd
sed -e 's@gdm:x:42:42:GDM:/var/state/gdm:/bin/bash@gdm:x:42:42:GDM:/var/state/gdm:/bin/false@' -i /etc/passwd
sed -e 's@/bin/false@/sbin/nologin@g' -i /etc/passwd
sed -e 's@/bin/sync@/sbin/nologin@g' -i /etc/passwd
sed -e 's@/sbin/shutdown@/sbin/nologin@g' -i /etc/passwd
sed -e 's@/sbin/halt@/sbin/nologin@g' -i /etc/passwd

sed -e '/^ftp:/d' -i /etc/passwd
sed -e '/^ftp:/d' -i /etc/group
sed -e '/^ftp:/d' -i /etc/shadow

sed -e '/^vbox:/d' -i /etc/passwd
sed -e '/^vbox:/d' -i /etc/group
sed -e '/^vbox:/d' -i /etc/shadow

sed -e '/^games:/d' -i /etc/passwd
sed -e '/^games:/d' -i /etc/group
sed -e '/^games:/d' -i /etc/shadow

sed -e '/^mail:/d' -i /etc/passwd
sed -e '/^mail:/d' -i /etc/group
sed -e '/^mail:/d' -i /etc/shadow

sed -e '/^news:/d' -i /etc/passwd
sed -e '/^news:/d' -i /etc/group
sed -e '/^news:/d' -i /etc/shadow

sed -e 's/dialout:x:16:uucp/dialout:x:16:/' -i /etc/group
sed -e '/^uucp:/d' -i /etc/passwd
sed -e '/^uucp:/d' -i /etc/group
sed -e '/^uucp:/d' -i /etc/shadow

sed -e '/^oprofile:/d' -i /etc/passwd
sed -e '/^oprofile:/d' -i /etc/group
sed -e '/^oprofile:/d' -i /etc/shadow

sed -e '/^smmsp:/d' -i /etc/passwd
sed -e '/^smmsp:/d' -i /etc/group
sed -e '/^smmsp:/d' -i /etc/shadow

sed -e '/^apache:/d' -i /etc/passwd
sed -e '/^apache:/d' -i /etc/group
sed -e '/^apache:/d' -i /etc/shadow

sed -e '/^pop:/d' -i /etc/passwd
sed -e '/^pop:/d' -i /etc/group
sed -e '/^pop:/d' -i /etc/shadow

sed -e '/^mysql:/d' -i /etc/passwd
sed -e '/^mysql:/d' -i /etc/group
sed -e '/^mysql:/d' -i /etc/shadow

sed -e '/^haldaemon:/d' -i /etc/passwd
sed -e '/^haldaemon:/d' -i /etc/group
sed -e '/^haldaemon:/d' -i /etc/shadow

rm -f /etc/gshadow

chmod 0755 /
chmod a-s /

# Docker requires this set to 1
# echo 0 > /proc/sys/net/ipv4/ip_forward

echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
echo 0 > /proc/sys/net/ipv4/conf/default/accept_source_route

echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects
echo 0 > /proc/sys/net/ipv4/conf/default/accept_redirects

echo 0 > /proc/sys/net/ipv4/conf/all/send_redirects
echo 0 > /proc/sys/net/ipv4/conf/default/send_redirects

echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

echo 1 > /proc/sys/net/ipv4/tcp_syncookies
