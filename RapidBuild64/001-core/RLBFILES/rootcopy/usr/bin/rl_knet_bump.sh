#!/bin/bash

#   1MB =   1048576
#   2MB =   2097152
#   4MB =   4194304
#   8MB =   8388608
#  16MB =  16777216
#  32MB =  33554432
#  64MB =  67108864
# 128MB = 134217728
# 256MB = 268435456

increasekval()
{
	VALUE=`cat $2`
	echo -n "$1: ${VALUE}"
	if [ ${VALUE} -lt "$3" ]; then
		echo "$3" > "$2"
		echo -n " (bumped to $3)"
	fi
	echo
}

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

COREDEF="1048576"
increasekval "rmem_default" "/proc/sys/net/core/rmem_default" "${COREDEF}"
increasekval "wmem_default" "/proc/sys/net/core/wmem_default" "${COREDEF}"

COREMAX="67108864"
increasekval "rmem_max" "/proc/sys/net/core/rmem_max" "${COREMAX}"
increasekval "wmem_max" "/proc/sys/net/core/wmem_max" "${COREMAX}"

UDPMIN="16777216"
increasekval "udp_rmem_min" "/proc/sys/net/ipv4/udp_rmem_min" "${UDPMIN}"
increasekval "udp_wmem_min" "/proc/sys/net/ipv4/udp_wmem_min" "${UDPMIN}"

echo "6187002 268435456 268435456" > /proc/sys/net/ipv4/udp_mem

# Just in case this happens to do anything at all
echo 1 > /proc/sys/net/ipv4/route/flush
