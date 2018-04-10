#!/bin/bash

if [ -z "$1" ]; then
	BGDIR="1920"
else
	BGDIR="$1"
fi

IMAGE=`ls -1 /usr/share/rapidlinux/backgrounds/$BGDIR/ | sort -R | head -n1`
hsetroot -center /usr/share/rapidlinux/backgrounds/$BGDIR/$IMAGE

# OLD WAY using fbsetbg
# sleep 1
# DISPLAY=":0.0" fbsetbg -r /usr/share/rapidlinux/backgrounds/$BGDIR
# DISPLAY=":0.1" fbsetbg -r /usr/share/rapidlinux/backgrounds/$BGDIR
# DISPLAY=":0.2" fbsetbg -r /usr/share/rapidlinux/backgrounds/$BGDIR
