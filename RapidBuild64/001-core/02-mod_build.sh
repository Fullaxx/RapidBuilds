#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ -d ${BUILDBASE}/${MODNUM} ]; then
  rm -r ${BUILDBASE}/${MODNUM}
fi

if [ -f ${MODULE} ]; then
  rm ${MODULE}
fi

mkdir -p ${DIR}

# Relocate GLIBC: Make sure glibc is loaded after glibc-zoneinfo
GLIBCPKG=`ls -1 glibc-?.??-${ARCH}-?.txz | cut -d@ -f1`
mv ${GLIBCPKG} zzz_${GLIBCPKG}

for PKG in *.txz; do

  echo "Exploding ${PKG} ..."

  tar xf ${PKG} -C ${DIR}

  if [[ ${PKG} == sysvinit-?.??-*.txz ]]; then
    echo "${PKG}: Removing /sbin/init reload from sysvinit install/doinst.sh ..."
    sed -e 's@  /sbin/init u@  echo "/sbin/init u" >/dev/null@' -i ${DIR}/install/doinst.sh
  fi

  if [[ ${PKG} == glibc-zoneinfo-*.txz ]]; then
    echo "${PKG}: Removing default timezone setting from glibc-zoneinfo install/doinst.sh ..."
    patch ${DIR}/install/doinst.sh RLBFILES/patches/glibc-zoneinfo-install.diff
  fi

  if [ -d ${DIR}/install ]; then
    if [ -f ${DIR}/install/doinst.sh ]; then
      bash -c "cd ${DIR}; source ./install/doinst.sh" || echo "*** WARNING *** ${PKG} install/doinst.sh (continuing anyway)"
    fi
    rm -rf ${DIR}/install
  fi

done

# https://www.cyberciti.biz/faq/bash-shell-check-for-any-mp3-files-in-directory/
shopt -s nullglob # enable
for PKG in *.xzm; do
  echo "Exploding ${PKG} ..."
  xzm2dir ${PKG} ${DIR} >/dev/null
done
shopt -u nullglob # disable
