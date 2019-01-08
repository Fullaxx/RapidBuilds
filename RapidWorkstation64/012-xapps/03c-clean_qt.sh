#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up QT
if [ "${INCQT}" == "Y" ]; then

if [ "${INCMARIADB}" != "Y" ]; then
  rm ${DIR}/usr/lib64/qt/plugins/sqldrivers/libqsqlmysql.so
fi

if [ "${INCLIBIODBC}" != "Y" ]; then
  rm ${DIR}/usr/lib64/qt/plugins/sqldrivers/libqsqlodbc.so
fi

fi