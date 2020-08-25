#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCMARIADB}" != "Y" ]; then
  rm -rf ${DIR}/usr/${LIBDIR}/perl5/vendor_perl/Bundle/DBD/mysql.pm
  rm -rf ${DIR}/usr/${LIBDIR}/perl5/vendor_perl/DBD/mysql
  rm -rf ${DIR}/usr/${LIBDIR}/perl5/vendor_perl/auto/DBD/mysql
fi

if [ "${INCTCL}" != "Y" ]; then
  rm -f ${DIR}/usr/${LIBDIR}/python?.?/lib-dynload/_tkinter.so
  rm -f ${DIR}/usr/${LIBDIR}/python?.?/lib-dynload/_tkinter.cpython-*.so
fi

if [ "${INCPYTHON}" == "Y" ]; then
  if [ -x ${DIR}/usr/bin/gtkless.py ]; then
    ln -s gtkless.py ${DIR}/usr/bin/gtkless
  fi
fi

if [ "${INCPYTHONTWO}" == "Y" ]; then
# Clean up any python2 modules we aren't using
  if [ "${INCPYTHONSANE}" != "Y" ]; then
    rm -f ${DIR}/usr/${LIBDIR}/python2.7/site-packages/_sane.so
    rm -r ${DIR}/usr/${LIBDIR}/python2.7/site-packages/python_sane-*-py2.7.egg-info
    rm -r ${DIR}/usr/${LIBDIR}/python2.7/site-packages/sane.*
  fi
else
# If we don't install python2
# we will link /usr/bin/python to /usr/bin/python3
  if [ -L ${DIR}/usr/bin/python3 ] && [ ! -L ${DIR}/usr/bin/python ]; then
    ln -s /usr/bin/python3 ${DIR}/usr/bin/python
  fi

#(
#  echo -n "Extracting "
#  cd ${DIR}/
#  tar --wildcards -xvf ${SLACKPKGDIR}/d/python2-2.?.*-*-?.txz usr/${LIBDIR}/libpython2.7.so.1.0
#) || bail "Couldnt find usr/${LIBDIR}/libpython2.7.so.1.0 in python2-2.?.*-*-?.txz"
#  ln -s libpython2.7.so.1.0 ${DIR}/usr/${LIBDIR}/libpython2.7.so
#  rm -rf ${DIR}/usr/${LIBDIR}/usr/python2.7
fi
