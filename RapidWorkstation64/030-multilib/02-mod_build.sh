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

for PKG in *.txz; do

  echo "Exploding ${PKG} ..."

  tar xf ${PKG} -C ${DIR}

  if [[ ${PKG} == glibc-*.txz ]]; then
    echo "${PKG}: Fixing install/doinst.sh ..."
    sed -e '/localtime/d' -i ${DIR}/install/doinst.sh
    sed -e '/sln/d' -i ${DIR}/install/doinst.sh
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
