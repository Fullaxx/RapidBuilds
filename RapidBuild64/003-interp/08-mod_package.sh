#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCPYTHON}" == "Y" ]; then
# pyconfig.h needs to be in the main modules always, not relegated to 006-devel
  if [ -L python2-2.?.*-*.txz ]; then
    tar xf python2-2.?.*-*.txz -C ${DIR} --wildcards 'usr/include/python2.?/pyconfig.h'
  fi
  tar xf python3-3.*.*-*.txz -C ${DIR} --wildcards 'usr/include/python3.*/pyconfig.h'
# ls -l ${DIR}/usr/include/python2.?/pyconfig.h ${DIR}/usr/include/python3.??/pyconfig.h
fi

dir2xzm ${DIR} ${MODULE} >/dev/null
rm -r ${DIR}

if [ -d ${MODDOCDIR} ]; then
  echo "Creating ${MODNUM}a-doc.xzm ..."
  dir2xzm ${MODDOCDIR} ${MODNUM}a-doc.xzm >/dev/null
  rm -r ${MODDOCDIR}
fi

if [ -d ${MODDEVDIR} ]; then
  echo "Creating ${MODNUM}a-dev.xzm ..."
  dir2xzm ${MODDEVDIR} ${MODNUM}a-dev.xzm >/dev/null
  rm -r ${MODDEVDIR}
fi

if [ -d ${MODINFODIR} ]; then
  echo "Creating ${MODNUM}a-info.xzm ..."
  dir2xzm ${MODINFODIR} ${MODNUM}a-info.xzm >/dev/null
  rm -r ${MODINFODIR}
fi

if [ -d ${MODMANDIR} ]; then
  echo "Creating ${MODNUM}a-man.xzm ..."
  dir2xzm ${MODMANDIR} ${MODNUM}a-man.xzm >/dev/null
  rm -r ${MODMANDIR}
fi

if [ -d ${MODGTKDOCDIR} ]; then
  echo "Creating ${MODNUM}a-gtkdocs.xzm ..."
  dir2xzm ${MODGTKDOCDIR} ${MODNUM}a-gtkdocs.xzm >/dev/null
  rm -r ${MODGTKDOCDIR}
fi

if [ -d ${BUILDBASE}/${MODNUM} ]; then
  rmdir ${BUILDBASE}/${MODNUM}
fi
