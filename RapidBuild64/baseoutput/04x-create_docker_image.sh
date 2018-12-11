#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ -z ${DOCKERTAG} ]; then exit 0; fi

shopt -s nullglob

DOCKERTEMP="/tmp/dockertemp-$$"
DOCKERFILE="${DOCKERTEMP}/Dockerfile"
# DATE=`date "+%y%m%d"`

mkdir ${DOCKERTEMP}
echo "FROM scratch" >> ${DOCKERFILE}
if [ -f 010-xorg.xzm ]; then
  cp xorg.conf ${DOCKERTEMP}/
fi

cd ${BASEDIR}

for XZMMOD in *.xzm; do
  echo "Converting ${XZMMOD} ..."
  rl_xm ${XZMMOD} mod >/dev/null
  ( cd mod; tar cf ${DOCKERTEMP}/${XZMMOD}.tar . )
  rm -rf mod
done

rm -f ${DOCKERTEMP}/000-kmods-*.xzm.tar
rm -f ${DOCKERTEMP}/007-wireless.xzm.tar
rm -f ${DOCKERTEMP}/020-man.xzm.tar
rm -f ${DOCKERTEMP}/021-doc.xzm.tar

cd ${MODSDIR}

for XZMMOD in *.xzm; do
  echo "Converting ${XZMMOD} ..."
  rl_xm ${XZMMOD} mod >/dev/null
  ( cd mod; tar cf ${DOCKERTEMP}/${XZMMOD}.tar . )
  rm -rf mod
done

cd ${DOCKERTEMP}

for TARFILE in *.tar; do
  echo "ADD ${TARFILE} /" >> ${DOCKERFILE}
done

if [ -f xorg.conf ]; then
  echo "COPY xorg.conf /etc/X11" >> ${DOCKERFILE}
fi

#echo 'CMD ["/bin/bash", "-l"]' >> ${DOCKERFILE}
echo 'CMD ["/bin/bash"]' >> ${DOCKERFILE}

if [ -S /var/run/docker.sock ]; then
  echo "Building docker image ${DOCKERTAG} ..."
  docker build . >Dockerlog 2>Dockererr
  if [ "$?" != "0" ]; then cat Dockererr; exit 1; fi
  DOCKERIMAGEID=`grep 'Successfully built' Dockerlog | awk '{print $3}'`
  docker tag ${DOCKERIMAGEID} ${DOCKERTAG}
#  docker tag ${DOCKERIMAGEID} fullaxx/rapidbuild64
#  docker login
#  docker push fullaxx/rapidbuild64:latest
fi

cd; rm -rf ${DOCKERTEMP}

shopt -u nullglob
