#!/bin/bash

NVXCBIN=`which nvidia-xconfig`

if [ $? == "0" ]; then
  $NVXCBIN --query-gpu-info
fi