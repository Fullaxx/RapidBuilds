#!/bin/bash

# NUMCPUS=`lscpu | grep 'CPU(s):' | grep -v NUMA | awk '{print $2}'`
# export MAKEALLCPUS="-j$NUMCPUS"

NUMCPUS=`nproc`
export MAKEALLCPUS="-j${NUMCPUS}"
