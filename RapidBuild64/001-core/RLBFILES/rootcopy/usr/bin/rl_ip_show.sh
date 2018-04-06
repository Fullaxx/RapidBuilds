#!/bin/bash

if [ -n "$1" ]; then
  ip addr show dev "$1"
else
  ip addr show
fi
