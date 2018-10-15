#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up doxygen
if [ "${INCDOXYGEN}" == "Y" ]; then
# if we dont have QT
  if [ "${INCQT}" != "Y" ]; then
    rm ${DIR}/usr/bin/doxywizard
  fi

# if we dont have xapian-core
  if [ "${INCXAPIANCORE}" != "Y" ]; then
    rm ${DIR}/usr/bin/doxysearch.cgi
    rm ${DIR}/usr/man/man1/doxysearch.1.gz
    rm ${DIR}/usr/bin/doxyindexer
    rm ${DIR}/usr/man/man1/doxyindexer.1.gz
  fi
fi
