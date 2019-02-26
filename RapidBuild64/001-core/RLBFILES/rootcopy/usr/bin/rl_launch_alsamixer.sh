#!/bin/bash

if [ -n "$1" ]; then
  Eterm -T AlsaMixer -g 160x48 -e alsamixer -c "$1"
else
  Eterm -T AlsaMixer -g 160x48 -e alsamixer
fi
