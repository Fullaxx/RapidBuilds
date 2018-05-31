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

# Relocate GLIBC: Make sure this is loaded after glibc-zoneinfo
GLIBCPKG=`ls -1 glibc-?.??-$ARCH-?.txz | cut -d@ -f1`
mv ${GLIBCPKG} zzz_${GLIBCPKG} || exit 1

for PKG in *.txz; do

  echo "Exploding ${PKG} ..."

  tar xf ${PKG} -C ${DIR} || exit 1

  if [[ ${PKG} == glibc-zoneinfo-*.txz ]]; then
    echo "${PKG}: Removing default timezone setting from glibc-zoneinfo install/doinst.sh ..."
    # sed -e 's@chroot . /bin/cp@cp@' -i ${DIR}/install/doinst.sh || exit 1
    patch ${DIR}/install/doinst.sh RLBFILES/patches/glibc-zoneinfo-install.diff || exit 1
  fi

  if [ -d ${DIR}/install ]; then
    if [ -f ${DIR}/install/doinst.sh ]; then
      bash -c "cd ${DIR}; source ./install/doinst.sh"
    fi
    rm -rf ${DIR}/install
  fi

done

# https://www.cyberciti.biz/faq/bash-shell-check-for-any-mp3-files-in-directory/
shopt -s nullglob # enable
for PKG in *.xzm; do
  echo "Exploding ${PKG} ..."
  xzm2dir ${PKG} ${DIR} >/dev/null || exit 1
done
shopt -u nullglob # disable

########
exit 0 #
########

rm -f ${XZMTODIRERRLOG}
for PKG in *.xzm; do

  echo "Exploding ${PKG} ..."
  xzm2dir ${PKG} ${DIR} >/dev/null 2>>${XZMTODIRERRLOG} || exit 1

done

if [ -s ${XZMTODIRERRLOG} ]; then
  cat ${XZMTODIRERRLOG}
  echo "We have errors!"
  exit 1
else
  rm -f ${XZMTODIRERRLOG}
fi

