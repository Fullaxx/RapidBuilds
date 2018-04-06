#!/bin/bash

if [ "$#" -ne "2" ]; then
  echo "$0 <device> <ESSID>"
  exit -1
fi

iwconfig "$1" essid "$2"
