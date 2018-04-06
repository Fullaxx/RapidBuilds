#!/bin/bash

SEARCHPATH="/bin /sbin"

if [ -d /lib -a ! -L /lib ]; then
  SEARCHPATH+=" /lib"
fi

if [ -d /lib64 -a ! -L /lib64 ]; then
  SEARCHPATH+=" /lib64"
fi

SEARCHPATH+=" /usr"

find $SEARCHPATH -type f ! -name ld-*.so -executable | xargs ldd > ~/files.txt
