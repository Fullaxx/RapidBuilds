#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# This is required if using the RapidLinux repo
echo "user_allow_other" >> ${DIR}/etc/fuse.conf

if [ "${INCLIBMARIADB}" == "Y" -a "${INCMARIADB}" != "Y" ]; then
# libapr needs libmariadb... really??
(
  echo -n "Extracting "
  cd ${DIR}/
  tar --wildcards -xvf ${SLACKPKGDIR}/ap/mariadb-*.txz usr/${LIBDIR}/libmariadb.so.?
) || bail "Couldnt find usr/${LIBDIR}/libmariadb.so.? in mariadb-*.txz"
fi

exit 0
#######################################
# seamonkey-solibs drops this file
# We will erase it and handle it below and a per-package basis
if [ -f ${DIR}/etc/ld.so.conf ]; then
  rm ${DIR}/etc/ld.so.conf
fi

if [ "${INCSEAMONKEYSOLIBS}" == "Y" ]; then
  mkdir -p ${DIR}/etc/ld.so.conf.d
  echo "/usr/${LIBDIR}/seamonkey" > ${DIR}/etc/ld.so.conf.d/seamonkey-solibs-${ARCH}.conf
fi
