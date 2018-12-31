#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCGROFF}" == "Y" ]; then
# Clean up Groff if we don't have X
  if [ "${INCMOD010XORG}" != "Y" ]; then
    rm ${DIR}/usr/bin/{gxditview,xtotroff}
  fi

# Fix Groff Documentation
  GROFFVER=`ls -1 groff-*.txz | cut -d- -f2`
  if [ -d ${DIR}/usr/share/doc/groff-${GROFFVER} ] && [ -d ${DIR}/usr/doc/groff-${GROFFVER} ]; then
    mv ${DIR}/usr/share/doc/groff-${GROFFVER}/* ${DIR}/usr/doc/groff-${GROFFVER}/
    rmdir ${DIR}/usr/share/doc/groff-${GROFFVER}
  fi
fi
