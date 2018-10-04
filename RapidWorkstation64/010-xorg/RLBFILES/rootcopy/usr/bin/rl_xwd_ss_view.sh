#!/bin/bash

if [ x"$1" == "x" ]; then
  echo "usage $0 <filename>"
  exit -1
fi

if [ -r $1 ]; then
  xwud -in $1
  exit 0;
fi

if [ -r $1.xwd ]; then
  xwud -in $1.xwd
  exit 0;
fi

echo "I couldnt find $1 or $1.xwd"
