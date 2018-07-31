#!/bin/bash

if [ `id -u` != "0" ]; then
	echo "Got Root?"
	exit 1
fi

if [ -n "$1" ]; then
  echo "$1" > /proc/sys/vm/swappiness
else
  cat /proc/sys/vm/swappiness
fi
