#!/bin/bash

NXC=`which nvidia-xconfig 2>/dev/null`
if [ "$?" == "0" ]; then
  ${NXC} --query-gpu-info
  echo
fi

xdriinfo
echo
xrandr -q
