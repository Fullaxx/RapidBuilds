#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f *.txz *.xzm

if [ "${INCBC}" == "Y" ]; then
# bc is req'd for kerel compilation
  ln -s ${SLACKPKGDIR}/ap/bc-*.txz
fi

if [ "${INCLINUXDOCTOOLS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/linuxdoc-tools-*.txz
fi

if [ "${INCRPM}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/rpm-*.txz
  ln -s ${SLACKPKGDIR}/a/rpm2tgz-*.txz
fi

if [ "${INCVIM}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/vim-*.txz
fi

if [ "${INCAUTOCONF}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/autoconf-*.txz
fi

if [ "${INCAUTOMAKE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/automake-*.txz
fi

if [ "${INCBINUTILS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/binutils-*.txz
fi

if [ "${INCBISON}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/bison-*.txz
fi

if [ "${INCCMAKE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/cmake-*.txz
fi

if [ "${INCCVS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/cvs-*.txz
fi

if [ "${INCFLEX}" == "Y" ]; then
# flex is req'd for bc
  ln -s ${SLACKPKGDIR}/d/flex-*.txz
fi

if [ "${INCGCC}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/gcc-?.?.?-*.txz
fi

if [ "${INCGCCGPLUSPLUS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/gcc-g++-?.?.?-*.txz
fi

if [ "${INCGDB}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/gdb-*.txz
fi

if [ "${INCGETTEXTTOOLS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/gettext-tools-*.txz
fi

if [ "${INCGIT}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/git-*.txz
fi

if [ "${INCGUILE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/guile-*.txz
fi

if [ "${INCINTLTOOL}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/intltool-*.txz
fi

if [ "${INCLIBTOOL}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/libtool-*.txz
fi

if [ "${INCLLVM}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/llvm-*.txz
fi

if [ "${INCM4}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/m4-*.txz
fi

if [ "${INCMAKE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/make-*.txz
fi

if [ "${INCMERCURIAL}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/mercurial-*.txz
fi

if [ "${INCNASM}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/nasm-*.txz
fi

if [ "${INCNINJA}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/ninja-*.txz
fi

if [ "${INCOPENCLHEADERS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/opencl-headers-*.txz
fi

if [ "${INCPATCHELF}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/patchelf-*.txz
fi

if [ "${INCPKGCONFIG}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/pkg-config-*.txz
fi

if [ "${INCPMAKE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/pmake-*.txz
fi

if [ "${INCRE2C}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/re2c-*.txz
fi

if [ "${INCSTRACE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/strace-*.txz
fi

if [ "${INCSUBVERSION}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/subversion-*.txz
fi

if [ "${INCYASM}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/d/yasm-*.txz
fi

if [ "${INCEMACS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/e/emacs-*.txz
fi

linkmodule "${KERNELPKGDIR}/kernel-crippledsrc.xzm"
linkmodule "${KERNELPKGDIR}/kernel-headers.xzm"
echo -n "Using Kernel: "; echo "${KERNVERS}"
