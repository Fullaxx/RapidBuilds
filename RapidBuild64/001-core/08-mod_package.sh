#!/bin/bash

source ../spec.sh
source ./module_spec.sh

dir2xzm ${DIR} ${MODULE} >/dev/null
rm -r ${DIR}

if [ -d ${MODDOCDIR} ]; then
  dir2xzm ${MODDOCDIR} ${MODNUM}a-doc.xzm >/dev/null
  rm -r ${MODDOCDIR}
fi

if [ -d ${MODINCDIR} ]; then
  dir2xzm ${MODINCDIR} ${MODNUM}a-inc.xzm >/dev/null
  rm -r ${MODINCDIR}
fi

if [ -d ${MODINFODIR} ]; then
  dir2xzm ${MODINFODIR} ${MODNUM}a-info.xzm >/dev/null
  rm -r ${MODINFODIR}
fi

if [ -d ${MODMANDIR} ]; then
  dir2xzm ${MODMANDIR} ${MODNUM}a-man.xzm >/dev/null
  rm -r ${MODMANDIR}
fi

if [ -d ${MODGTKDOCDIR} ]; then
  dir2xzm ${MODGTKDOCDIR} ${MODNUM}a-gtkdocs.xzm >/dev/null
  rm -r ${MODGTKDOCDIR}
fi

if [ -d ${MODPYTHONDIR} ]; then
  dir2xzm ${MODPYTHONDIR} ${MODNUM}a-python.xzm >/dev/null
  rm -r ${MODPYTHONDIR}
fi

if [ -d ${BUILDBASE}/${MODNUM} ]; then
  rmdir ${BUILDBASE}/${MODNUM}
fi
