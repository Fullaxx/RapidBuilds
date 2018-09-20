#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up emacs if we dont have X11
if [ "${INCEMACS}" == "Y" -a "${INCMOD010XORG}" != "Y" ]; then
  rm ${DIR}/usr/bin/emacs-*-with-x11
fi
