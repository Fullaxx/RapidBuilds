#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ -d ${DIR}/var/log/setup -a ! -L ${DIR}/var/log/setup ]; then
  mkdir -p ${DIR}/var/lib/pkgtools/setup
  mv ${DIR}/var/log/setup/* ${DIR}/var/lib/pkgtools/setup/
  rm -r ${DIR}/var/log/setup
  ln -s ../lib/pkgtools/setup ${DIR}/var/log/setup
fi

if [ -d ${DIR}/usr/man ]; then
  mkdir -p ${MODMANDIR}/usr/man
  mv ${DIR}/usr/man/man? ${MODMANDIR}/usr/man
  rm -r ${DIR}/usr/man
fi

# Remove /usr/share/doc if it is empty directory
if [ -d ${DIR}/usr/share/doc ] && [ ! -L ${DIR}/usr/share/doc ]; then
  if [ -z "$(ls -A ${DIR}/usr/share/doc)" ]; then
    rmdir ${DIR}/usr/share/doc
  fi
fi

if [ -d ${DIR}/usr/share/doc ] && [ ! -L ${DIR}/usr/share/doc ]; then
  if [ ! -d ${DIR}/usr/doc ]; then mkdir -p ${DIR}/usr/doc; fi
  mv ${DIR}/usr/share/doc/* ${DIR}/usr/doc/
  rmdir ${DIR}/usr/share/doc
fi

if [ -d ${DIR}/usr/share/doc ] && [ ! -L ${DIR}/usr/share/doc ]; then
  if [ ! -d ${DIR}/usr/doc ]; then mkdir -p ${DIR}/usr/doc; fi
  mv ${DIR}/usr/share/doc/* ${DIR}/usr/doc/
  rmdir ${DIR}/usr/share/doc
fi

if [ -d ${DIR}/usr/doc ]; then
  mkdir -p ${MODDOCDIR}/usr
  mv ${DIR}/usr/doc ${MODDOCDIR}/usr/
fi

if [ -d ${DIR}/usr/include ]; then
  mkdir -p ${MODDEVDIR}/usr
  mv ${DIR}/usr/include ${MODDEVDIR}/usr/
fi

SLCNT=`ls -1 ${DIR}/${LIBDIR}/*.a 2>/dev/null | wc -l`
if [ ${SLCNT} != "0" ]; then
  mkdir -p ${MODDEVDIR}/${LIBDIR}
  mv ${DIR}/${LIBDIR}/*.a ${MODDEVDIR}/${LIBDIR}/
fi

SLCNT=`ls -1 ${DIR}/usr/${LIBDIR}/*.a 2>/dev/null | wc -l`
if [ ${SLCNT} != "0" ]; then
  mkdir -p ${MODDEVDIR}/usr/${LIBDIR}
  mv ${DIR}/usr/${LIBDIR}/*.a ${MODDEVDIR}/usr/${LIBDIR}/
fi

if [ -d ${DIR}/usr/info ]; then
  mkdir -p ${MODINFODIR}/usr
  mv ${DIR}/usr/info ${MODINFODIR}/usr/
fi

if [ -d ${DIR}/usr/share/gtk-doc ]; then
  mkdir -p ${MODGTKDOCDIR}/usr/share
  mv ${DIR}/usr/share/gtk-doc ${MODGTKDOCDIR}/usr/share
fi

PYEXISTS=`ls -d1 ${DIR}/usr/${LIBDIR}/python?.? 2>/dev/null | wc -l`
if [ "${PYEXISTS}" -ne "0" ]; then
  mkdir -p ${MODPYTHONDIR}/usr/${LIBDIR}
  mv ${DIR}/usr/${LIBDIR}/python?.? ${MODPYTHONDIR}/usr/${LIBDIR}/
fi
