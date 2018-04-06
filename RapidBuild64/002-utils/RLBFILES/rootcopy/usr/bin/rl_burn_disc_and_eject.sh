#!/bin/bash

if [ x"$1" == "x" ]; then
  echo "Must have an ISO file to burn...Exiting"
  echo "usage: $0 <iso> [/dev/cdwriter]"
  exit -1;
fi

ISO="$1"
DEV="/dev/sr0"

if [ x"$2" != "x" ]; then
  DEV="$2"
fi

cdrecord -v -eject -dao -dev=$DEV $ISO driveropts=burnfree || echo "BURN FAILED!!"
