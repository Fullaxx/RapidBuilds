#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# yconfig.h needs to be in the main modules always, not relegated to 006-devel
tar xf python-2.?.*-*.txz  -C ${DIR} --wildcards 'usr/include/python2.?/pyconfig.h' || exit 1
tar xf python3-3.?.*-*.txz -C ${DIR} --wildcards 'usr/include/python3.??/pyconfig.h' || exit 1
# ls -l ${DIR}/usr/include/python2.?/pyconfig.h ${DIR}/usr/include/python3.??/pyconfig.h

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

if [ -d ${BUILDBASE}/${MODNUM} ]; then
  rmdir ${BUILDBASE}/${MODNUM}
fi
