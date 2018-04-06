#!/bin/bash

# http://shmilyxbq-compcache.googlecode.com/hg/README
# http://weirdfellow.wordpress.com/2011/05/04/compressed-ram-with-zram/
# http://www.funtoo.org/Zram

if [ x"$1" == "x" ]; then
  echo "Usage: $0 <num>"
  exit 11
fi

if lsmod | grep -q zram ; then
  echo "module zram is already loaded..."
fi

# modprobe zram num_devices="$1"
modprobe zram zram_num_devices="$1"
ls -l /dev/zram*
