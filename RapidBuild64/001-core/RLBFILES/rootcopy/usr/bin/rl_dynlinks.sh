#!/bin/bash

### ALWAYS DO THIS FIRST ###
/sbin/ldconfig
############################

SEARCHPATH="/bin /sbin"

if [ -d /lib ] && [ ! -L /lib ]; then
  SEARCHPATH+=" /lib"
fi

if [ -d /lib64 ] && [ ! -L /lib64 ]; then
  SEARCHPATH+=" /lib64"
fi

SEARCHPATH+=" /usr"

find ${SEARCHPATH} -type f ! -name 'ld-*.so' -executable | \
grep -v '/usr/lib64/java' | \
xargs ldd >/tmp/dynlinks.txt 2>/dev/null

if grep 'not found' /tmp/dynlinks.txt ; then
  echo "rl_dynlinks.sh: See /tmp/dynlinks.txt for more info"
  exit 1
fi
