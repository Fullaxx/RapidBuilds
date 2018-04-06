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

  if [[ ${PKG} == seamonkey-solibs-*.txz ]]; then
    echo "${PKG}: Removing ld.so.conf manipulation from install/doinst.sh ..."
    sed -e 's/^if/#if/g' -e 's/^fi/#fi/g' -e 's/  echo/#echo/' -e 's@  /sbin/ldconfig@#/sbin/ldconfig@' -i ${DIR}/install/doinst.sh || exit 1
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

# seamonkey-solibs-2.49.1-x86_64-1.txz
# cat fs/install/doinst.sh | sed -e 's/^if/#if/g' -e 's/^fi/#fi/g' -e 's/  echo/#echo/' -e 's@  /sbin/ldconfig@#/sbin/ldconfig@'
