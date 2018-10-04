#!/bin/bash

if [ x"$1" == "x" ]; then
  echo "usage $0 <filename>"
  exit -1
fi

echo "Click the window you wish to screenshot..."
xwd -out $1.xwd

echo "Screenshot saved to $1.xwd"
