#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ -d ${BDIR} ]; then rm -r ${BDIR}; fi
mkdir -p ${BDIR}

rm -f *.xzm

ln -s ${KERNELPKGDIR}/000-kmods-${KERNVERS}.xzm

shopt -s nullglob # enable

for PKG in ../0[013]?-*/0[013]?-*.xzm; do ln -s ${PKG}; done

####################################

DIR="${BDIR}/fsdoc"
rm -rf ${DIR}
mkdir ${DIR}

for PKG in ../0[01]*/0[01]?a-doc.xzm; do
  echo "Exploding ${PKG} ..."
  xzm2dir ${PKG} ${DIR} >/dev/null || exit 1
done
for PKG in ../0[01]*/0[01]?a-gtkdocs.xzm; do
  echo "Exploding ${PKG} ..."
  xzm2dir ${PKG} ${DIR} >/dev/null || exit 1
done
for PKG in ../0[01]*/0[01]?a-info.xzm; do
  echo "Exploding ${PKG} ..."
  xzm2dir ${PKG} ${DIR} >/dev/null || exit 1
done

####################################

DIR="${BDIR}/fsman"
rm -rf ${DIR}
mkdir ${DIR}

for PKG in ../0[01]*/0[01]?a-man.xzm; do
  echo "Exploding ${PKG} ..."
  xzm2dir ${PKG} ${DIR} >/dev/null || exit 1
done
find ${DIR} -type f -exec chmod 0644 {} \;

####################################

if [ -e 003-interp.xzm ]; then

DIR="${BDIR}/fspython"
rm -rf ${DIR}
mkdir ${DIR}

echo "Exploding 003-interp.xzm ..."
xzm2dir 003-interp.xzm ${DIR} >/dev/null || exit 1
for PKG in ../0[01]*/0[01]?a-python.xzm; do
  echo "Exploding ${PKG} ..."
  xzm2dir ${PKG} ${DIR} >/dev/null || exit 1
done

fi

####################################

if [ -e 006-devel.xzm ]; then

DIR="${BDIR}/fsdevel"
rm -rf ${DIR}
mkdir ${DIR}

echo "Exploding 006-devel.xzm ..."
xzm2dir 006-devel.xzm ${DIR} >/dev/null || exit 1
for PKG in ../0[01]*/0[01]?a-inc.xzm; do
  echo "Exploding ${PKG} ..."
  xzm2dir ${PKG} ${DIR} >/dev/null || exit 1
done

fi

####################################

shopt -u nullglob # disable
