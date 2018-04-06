#!/bin/bash

if [ -n "$1" ]; then
  echo $1 > /proc/sys/vm/swappiness
else
  cat /proc/sys/vm/swappiness
fi
