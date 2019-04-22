#!/bin/bash

# https://askubuntu.com/questions/65951/how-to-disable-the-touchpad
# https://nitstorm.github.io/blog/disabling-touchpad-laptop-linux/

# xinput list
# xinput set-prop 12 "Device Enabled" 0
# xinput --disable 12

TOUCHPADID=`xinput list | grep -i touchpad | cut -f 2 | grep -oE '[[:digit:]]+'`
xinput disable ${TOUCHPADID}
