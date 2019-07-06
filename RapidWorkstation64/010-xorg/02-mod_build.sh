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
# mkdir -p ${DIR}/usr/share/fonts/misc
# mkdir -p ${DIR}/usr/share/fonts/encodings
# mkdir -p ${DIR}/usr/share/fonts/encodings/large

# https://www.cyberciti.biz/faq/bash-shell-check-for-any-mp3-files-in-directory/
shopt -s nullglob # enable
for PKG in *.txz; do

  echo "Exploding ${PKG} ..."

  tar xf ${PKG} -C ${DIR}

  if [ -d ${DIR}/install ]; then
    if [ -f ${DIR}/install/doinst.sh ]; then
#      if grep -q /usr/share/fonts/misc ${DIR}/install/doinst.sh ; then
#      if grep -q fc-cache ${DIR}/install/doinst.sh ; then
#        TIMESTAMP=`date "+%y%m%d%H%M%S"`
#        mv ${DIR}/install/doinst.sh /tmp/doinst.${TIMESTAMP}.sh
#        sed -e "s@/usr/share/fonts/misc@usr/share/fonts/misc@g" -i ${DIR}/install/doinst.sh
#        echo > ${DIR}/install/doinst.sh # just get rid of it
#        grep usr/share/fonts/misc ${DIR}/install/doinst.sh
#        sed -e "s@/usr/bin/fc-cache -f@echo /usr/bin/fc-cache -f@g" -i ${DIR}/install/doinst.sh
#      fi

#      echo -n "Font Count Before: "
#      find ${DIR}/usr/share/fonts/ -type f | wc -l
      bash -c "cd ${DIR}; source ./install/doinst.sh" || echo "*** WARNING *** ${PKG} install/doinst.sh (continuing anyway)"
#      echo -n "Font Count After : "
#      find ${DIR}/usr/share/fonts/ -type f | wc -l
    fi
    rm -rf ${DIR}/install
  fi

done

for PKG in *.xzm; do
  echo "Exploding ${PKG} ..."
  xzm2dir ${PKG} ${DIR} >/dev/null
done
shopt -u nullglob # disable
