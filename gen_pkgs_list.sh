#!/bin/bash

if [ `id -u` != "0" ]; then
  echo "Got Root?"
  exit 1
fi

set -e

gen_pkg_list()
{
  pushd $1
  for DIR in *; do
    if [ -d ${DIR} ] && [ ! -L ${DIR} ] ; then
      if [ "${DIR}" != "baseoutput" ]; then
      (
        echo ${DIR}
        cd ${DIR}
        ./01-mod_linkslack.sh
        if [ -x ./01a-mod_linkadds.sh ]; then
          ./01a-mod_linkadds.sh
        fi
        ls -1 *.txz *.xzm 2>/dev/null >${DIR}.mod_pkg_list.txt
      )
      fi
    fi
  done
#  cat */*.mod_pkg_list.txt >$1.proj_pkg_list.txt
  ls -1 */*.txz */*.xzm | sort >$1.proj_pkg_list.txt
  popd
}

RBDIR=`dirname $0`
if [ "${RBDIR}" == "." ]; then RBDIR=`pwd`; fi
export RAPIDBUILDSDIR="${RBDIR}"

cd ${RAPIDBUILDSDIR}
./clean.sh
shopt -s nullglob
for PROJ in `cat projects.list`; do
  gen_pkg_list "${PROJ}"
done
shopt -u nullglob
tar cf manifesto.tar */*.proj_pkg_list.txt
