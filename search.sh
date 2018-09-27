#!/bin/bash

if [ -z "$1" ]; then
  echo "$0: <text>"
  exit 1
fi

find . -type f -name "*.sh" -exec grep -iH "$1" {} \;
