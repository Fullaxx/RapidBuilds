#!/bin/bash

DEV="/dev/sr0"
BLANKTYPE="fast"

while [ -n "$1" ]; do
  if [ "$1" == "full" -o "$1" == "all" -o "$1" == "disc" -o "$1" == "disk" ]; then
    BLANKTYPE="all"
  elif [ -b "$1" ]; then
    DEV="$1"
  fi
  shift
done

cdrecord -v -eject -dev=$DEV blank=$BLANKTYPE
