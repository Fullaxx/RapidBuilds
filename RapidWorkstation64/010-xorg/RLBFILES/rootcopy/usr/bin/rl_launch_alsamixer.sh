#!/bin/bash

if [ -n "$1" ]; then
  xterm -T AlsaMixer -g 160x48 -e alsamixer -c "$1"
else
  xterm -T AlsaMixer -g 160x48 -e alsamixer
fi
