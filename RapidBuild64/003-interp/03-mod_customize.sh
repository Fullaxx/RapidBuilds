#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "$INCMARIADB" != "Y" ]; then
  rm -rf ${DIR}/usr/${LIBDIR}/perl5/vendor_perl/Bundle/DBD/mysql.pm
  rm -rf ${DIR}/usr/${LIBDIR}/perl5/vendor_perl/DBD/mysql
  rm -rf ${DIR}/usr/${LIBDIR}/perl5/vendor_perl/auto/DBD/mysql
fi

# WRAP THIS WITH INCTCL INCTK or something
rm -f ${DIR}/usr/${LIBDIR}/python?.?/lib-dynload/_tkinter.so
rm -f ${DIR}/usr/${LIBDIR}/python?.?/lib-dynload/_tkinter.cpython-*.so

if [ -x ${DIR}/usr/bin/gtkless.py ]; then
  ln -s gtkless.py ${DIR}/usr/bin/gtkless
fi
