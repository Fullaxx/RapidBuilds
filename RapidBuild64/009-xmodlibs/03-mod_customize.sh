#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCLIBMARIADB}" == "Y" -a "${INCMARIADB}" != "Y" ]; then
# libapr needs libmariadb... really??
(
  echo -n "Extracting "
  cd ${DIR}/
  tar --wildcards -xvf ${SLACKPKGDIR}/ap/mariadb-*.txz usr/${LIBDIR}/libmariadb.so.?
) || bail "Couldnt find usr/${LIBDIR}/libmariadb.so.? in mariadb-*.txz"
fi
