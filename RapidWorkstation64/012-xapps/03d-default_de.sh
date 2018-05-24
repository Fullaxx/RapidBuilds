#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Set a defaukt DE based on the value in ${DEFAULTDE}
case "${DEFAULTDE}" in
     "blackbox") ln -s xinitrc.blackbox      ${DIR}/etc/X11/xinit/xinitrc ;;
"enlightenment") ln -s xinitrc.enlightenment ${DIR}/etc/X11/xinit/xinitrc ;;
      "fluxbox") ln -s xinitrc.fluxbox       ${DIR}/etc/X11/xinit/xinitrc ;;
      "openbox") ln -s xinitrc.openbox       ${DIR}/etc/X11/xinit/xinitrc ;;
         "xfce") ln -s xinitrc.xfce          ${DIR}/etc/X11/xinit/xinitrc ;;
          "kde") ln -s xinitrc.kde           ${DIR}/etc/X11/xinit/xinitrc ;;
esac
