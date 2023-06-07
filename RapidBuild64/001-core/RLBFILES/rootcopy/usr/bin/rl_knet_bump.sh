#!/bin/bash

if [ `id -u` != "0" ]; then
  echo "Got Root?"
  exit 1
fi

# cat /proc/sys/net/core/rmem_default
# cat /proc/sys/net/core/wmem_default
# cat /proc/sys/net/core/rmem_max
# cat /proc/sys/net/core/wmem_max

# cat /proc/sys/net/ipv4/tcp_mem
# cat /proc/sys/net/ipv4/tcp_rmem
# cat /proc/sys/net/ipv4/tcp_wmem
# cat /proc/sys/net/ipv4/udp_mem
# cat /proc/sys/net/ipv4/udp_rmem_min
# cat /proc/sys/net/ipv4/udp_wmem_min

doublekval()
{
	ORIG=`cat $1`
#	ANSWER=`calc "2*${VALUE}" | awk '{print $1}'`
	NEW=$(( 2 * ORIG ));
	SIZEMB=$(( NEW / 1000000));
	echo "${NEW}" >$1
	echo "$1 doubled to ${SIZEMB}MB"
}

doublekudpmem()
{
	ORIGFIRST=`cat /proc/sys/net/ipv4/udp_mem | awk '{print $1}'`
	ORIGSECOND=`cat /proc/sys/net/ipv4/udp_mem | awk '{print $2}'`
	ORIGTHIRD=`cat /proc/sys/net/ipv4/udp_mem | awk '{print $3}'`
	NEWONE=$(( 2 * ORIGFIRST ));
	NEWTWO=$(( 2 * ORIGSECOND ));
	NEWTHREE=$(( 2 * ORIGTHIRD ));
	echo "${NEWONE} ${NEWTWO} ${NEWTHREE}" >/proc/sys/net/ipv4/udp_mem
}

doublekval "/proc/sys/net/core/rmem_default"
doublekval "/proc/sys/net/core/wmem_default"

doublekval "/proc/sys/net/core/rmem_max"
doublekval "/proc/sys/net/core/wmem_max"

doublekval "/proc/sys/net/ipv4/udp_rmem_min"
doublekval "/proc/sys/net/ipv4/udp_wmem_min"

# echo "134217728 1073741824 1073741824" >/proc/sys/net/ipv4/udp_mem
doublekudpmem
