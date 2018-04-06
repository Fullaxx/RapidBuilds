#!/bin/bash

if [ -n "$1" ]; then
  ip -6 route show dev "$1"
else
  ip -6 route show
fi
