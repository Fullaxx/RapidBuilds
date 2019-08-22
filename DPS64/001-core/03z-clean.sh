#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# If we don't have netfilter, we can't do traffic control
if [ "${INCNETFILTER}" != "Y" ]; then
  rm ${DIR}/sbin/tc ${DIR}/usr/sbin/tc
#  rm ${DIR}/usr/${LIBDIR}/tc/{m_xt.so,m_ipt.so}
  rm -r ${DIR}/usr/${LIBDIR}/tc
  rm ${DIR}/usr/share/bash-completion/completions/tc
fi

# Don't need these for a Docker base image
rm -f ${DIR}/usr/${LIBDIR}/libidn.so.*
rm -f ${DIR}/usr/${LIBDIR}/{libcups,libcupsimage}.*
rm -f ${DIR}/usr/${LIBDIR}/{libjpeg,libturbojpeg,libpng14,libpng16,libtiff,libtiffxx}.*

rm -rf ${DIR}/opt/refind
