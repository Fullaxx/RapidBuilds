#!/bin/bash

if [ -n "$1" ]; then
  #ip -6 neigh show | grep "dev $1 lladdr"
  ip -6 neigh show dev "$1"
else
  ip -6 neigh show
fi
