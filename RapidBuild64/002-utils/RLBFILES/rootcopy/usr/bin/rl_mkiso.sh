#!/bin/bash

if [ x"$1" == "x" ]; then
  echo "usage: $0 <output.iso> <files to add ...>"
  exit -1;
fi

ISO="$1"
shift

if [ x"$1" == "x" ]; then
  echo "usage: $0 <output.iso> <files to add ...>"
  exit -2;
fi

mkisofs -R -J -o $ISO $*
