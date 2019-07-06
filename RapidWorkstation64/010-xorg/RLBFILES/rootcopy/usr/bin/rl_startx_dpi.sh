#!/bin/bash

if [ -z "$1" ]; then
  echo -n "$0: <DPI>"
  exit 1
fi

DPI="$1"

startx -- -dpi "${DPI}"
