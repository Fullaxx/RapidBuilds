#!/bin/sh

watch -n1 "ifconfig $1; iwconfig $1; iw dev $1 link"
