#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Set a defaukt DE based on the value in ${DEFAULTDE}
case "${DEFAULTDE}" in
   "fluxbox") ln -s xinitrc.fluxbox  ${DIR}/etc/X11/xinit/xinitrc ;;
  "blackbox") ln -s xinitrc.blackbox ${DIR}/etc/X11/xinit/xinitrc ;;
      "xfce") ln -s xinitrc.xfce     ${DIR}/etc/X11/xinit/xinitrc ;;
       "kde") ln -s xinitrc.kde      ${DIR}/etc/X11/xinit/xinitrc ;;
esac
