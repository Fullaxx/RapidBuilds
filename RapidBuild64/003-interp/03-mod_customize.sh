#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCMARIADB}" != "Y" ]; then
  rm -rf ${DIR}/usr/${LIBDIR}/perl5/vendor_perl/Bundle/DBD/mysql.pm
  rm -rf ${DIR}/usr/${LIBDIR}/perl5/vendor_perl/DBD/mysql
  rm -rf ${DIR}/usr/${LIBDIR}/perl5/vendor_perl/auto/DBD/mysql
fi

if [ "${INCTCL}" != "Y" ]; then
  rm -f ${DIR}/usr/${LIBDIR}/python?.*/lib-dynload/_tkinter.so
  rm -f ${DIR}/usr/${LIBDIR}/python?.*/lib-dynload/_tkinter.cpython-*.so
fi

if [ "${INCPYTHON}" == "Y" ]; then
  if [ -x ${DIR}/usr/bin/gtkless.py ]; then
    ln -s gtkless.py ${DIR}/usr/bin/gtkless
  fi
fi

# Link /usr/bin/python to /usr/bin/python3
if [ -L ${DIR}/usr/bin/python3 ] && [ ! -L ${DIR}/usr/bin/python ]; then
  ln -s /usr/bin/python3 ${DIR}/usr/bin/python
fi
