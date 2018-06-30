#!/bin/bash

source ../spec.sh
source ./module_spec.sh

mkdir -p ${NEWDIR}/usr

mv ${DIR}/lib ${NEWDIR}
mv ${DIR}/usr/lib ${NEWDIR}/usr

# GLIBCVERSION=`ls -1 glibc-*.txz | awk -F- '{print $2}'`
# ln -s ld-${GLIBCVERSION}.so ${NEWDIR}/lib/ld-linux.so.2
ln -s ld-linux.so.2 ${NEWDIR}/lib/ld-lsb.so.3

rm ${NEWDIR}/usr/lib/*.a
rm -r ${NEWDIR}/usr/lib/locale

rm -r ${DIR}
mv ${NEWDIR} ${DIR}
