#!/bin/bash

printkval()
{
	VALUE=`cat $1`
	echo -en "$1:\t${VALUE}"
	echo
}

printkval "/proc/sys/net/core/rmem_default"
printkval "/proc/sys/net/core/wmem_default"
printkval "/proc/sys/net/core/rmem_max"
printkval "/proc/sys/net/core/wmem_max"

printkval "/proc/sys/net/ipv4/tcp_mem"
printkval "/proc/sys/net/ipv4/tcp_rmem"
printkval "/proc/sys/net/ipv4/tcp_wmem"
printkval "/proc/sys/net/ipv4/udp_mem"
printkval "/proc/sys/net/ipv4/udp_rmem_min"
printkval "/proc/sys/net/ipv4/udp_wmem_min"
