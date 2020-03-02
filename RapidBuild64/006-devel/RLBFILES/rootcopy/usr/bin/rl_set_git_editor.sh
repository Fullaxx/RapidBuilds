#!/bin/bash

if [ -z "$1" ]; then
  echo "$0: <editor>"
  exit 1
fi

git config --global core.editor $(which $1)
