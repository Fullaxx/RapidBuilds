#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ -d ${DIR}/usr/man ]; then
  mkdir -p ${MODMANDIR}/usr/man;
  mv ${DIR}/usr/man/man? ${MODMANDIR}/usr/man
  rm -r ${DIR}/usr/man
fi

if [ -d ${DIR}/usr/share/doc -a ! -L ${DIR}/usr/share/doc ]; then
  if [ ! -d ${DIR}/usr/doc ]; then mkdir -p ${DIR}/usr/doc; fi
  mv ${DIR}/usr/share/doc/* ${DIR}/usr/doc/
  rmdir ${DIR}/usr/share/doc
fi

if [ -d ${DIR}/usr/doc ]; then
  mkdir -p ${MODDOCDIR}/usr
  mv ${DIR}/usr/doc ${MODDOCDIR}/usr/
fi

if [ -d ${DIR}/usr/include ]; then
  mkdir -p ${MODINCDIR}/usr
  mv ${DIR}/usr/include ${MODINCDIR}/usr/
fi

if [ -d ${DIR}/usr/info ]; then
  mkdir -p ${MODINFODIR}/usr
  mv ${DIR}/usr/info ${MODINFODIR}/usr/
fi

if [ -d ${DIR}/usr/share/gtk-doc ]; then
  mkdir -p ${MODGTKDOCDIR}/usr/share
  mv ${DIR}/usr/share/gtk-doc ${MODGTKDOCDIR}/usr/share
fi