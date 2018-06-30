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

# https://www.cyberciti.biz/faq/bash-shell-check-for-any-mp3-files-in-directory/
shopt -s nullglob # enable
for PKG in *.txz; do

  echo "Exploding ${PKG} ..."

  tar xf ${PKG} -C ${DIR}

  if [ -d ${DIR}/install ]; then
    if [ -f ${DIR}/install/doinst.sh ]; then
      bash -c "cd ${DIR}; source ./install/doinst.sh" || echo "*** FAILED *** ${PKG} install/doinst.sh (continuing anyway)"
    fi
    rm -rf ${DIR}/install
  fi

done

for PKG in *.xzm; do
  echo "Exploding ${PKG} ..."
  xzm2dir ${PKG} ${DIR} >/dev/null
done
shopt -u nullglob # disable
