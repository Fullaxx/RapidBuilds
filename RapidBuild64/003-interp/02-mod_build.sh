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

  tar xf ${PKG} -C ${DIR} || exit 1

  if [[ ${PKG} == perl-*.txz ]]; then
    if grep -q pstruct ${DIR}/install/doinst.sh ; then
      #echo "pstruct found in ${DIR}/install/doinst.sh"
      if [ ! -x ${DIR}/usr/bin/pstruct -a ! -x ${DIR}/usr/bin/c2ph ]; then
        #echo "c2ph and pstruct not found in ${PKG}"
        echo "${PKG}: Removing broken manpage links in install/doinst.sh ..."
        sed -e '/pstruct/d' -i ${DIR}/install/doinst.sh
      fi
    fi
  fi

  if [ -d ${DIR}/install ]; then
    if [ -f ${DIR}/install/doinst.sh ]; then
      bash -c "cd ${DIR}; source ./install/doinst.sh"
    fi
    rm -rf ${DIR}/install
  fi

done

for PKG in *.xzm; do
  echo "Exploding ${PKG} ..."
  xzm2dir ${PKG} ${DIR} >/dev/null || exit 1
done
shopt -u nullglob # disable
