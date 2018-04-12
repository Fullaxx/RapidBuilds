#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Set fluxbox at the default DE
# We should turn this into a config option
ln -s xinitrc.fluxbox ${DIR}/etc/X11/xinit/xinitrc
