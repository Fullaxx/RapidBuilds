#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up QT
if [ "${INCQT}" == "Y" ]; then

if [ "${INCMARIADB}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/qt/plugins/sqldrivers/libqsqlmysql.so
fi

if [ "${INCLIBIODBC}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/qt/plugins/sqldrivers/libqsqlodbc.so
fi

fi

# Clean up QT5
if [ "${INCQTFIVE}" == "Y" ] && [ "${INCSLACKQTFIVE}" == "Y" ]; then

if [ "${INCMARIADB}" != "Y" ]; then
  rm ${DIR}/usr/${LIBDIR}/qt5/plugins/sqldrivers/libqsqlmysql.so
fi

fi
