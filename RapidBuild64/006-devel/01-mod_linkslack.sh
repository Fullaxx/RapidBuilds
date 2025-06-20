#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f *.txz *.xzm

if [ "${INCAMFHEADERS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/AMF-headers-*.txz
fi

if [ "${INCBC}" == "Y" ]; then
# bc is req'd for kerel compilation
  linkpackage ${SLACKPKGDIR}/ap/bc-*.txz
fi

if [ "${INCLINUXDOCTOOLS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/linuxdoc-tools-*.txz
fi

if [ "${INCRPM}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/rpm-*.txz
  linkpackage ${SLACKPKGDIR}/a/rpm2tgz-*.txz
fi

if [ "${INCTEXINFO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/texinfo-*.txz
fi

if [ "${INCVIM}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/vim-*.txz
fi

if [ "${INCAUTOCONF}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/autoconf-*.txz
fi

if [ "${INCAUTOMAKE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/automake-*.txz
fi

if [ "${INCBINUTILS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/binutils-*.txz
fi

if [ "${INCBISON}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/bison-*.txz
fi

if [ "${INCCMAKE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/cmake-*.txz
fi

if [ "${INCCVS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/cvs-*.txz
fi

if [ "${INCDOXYGEN}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/doxygen-*.txz
fi

if [ "${INCFLEX}" == "Y" ]; then
# flex is req'd for bc
  linkpackage ${SLACKPKGDIR}/d/flex-*.txz
fi

if [ "${INCGCC}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/gcc-[0-9][0-9].[0-9].[0-9]-*.txz
fi

if [ "${GCCGMTWO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/gcc-gm2-[0-9][0-9].[0-9].[0-9]-*.txz
fi

if [ "${INCGCCGO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/gcc-go-[0-9][0-9].[0-9].[0-9]-*.txz
fi

if [ "${INCGCCGPLUSPLUS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/gcc-g++-[0-9][0-9].[0-9].[0-9]-*.txz
fi

if [ "${INCGDB}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/gdb-*.txz
fi

if [ "${INCGETTEXT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/gettext-0.*.txz
fi

if [ "${INCGETTEXTTOOLS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/gettext-tools-*.txz
fi

if [ "${INCGPERF}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/gperf-*.txz
fi

if [ "${INCGUILE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/guile-*.txz
fi

if [ "${INCGYP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/gyp-*.txz
fi

if [ "${INCINTLTOOL}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/intltool-*.txz
fi

if [ "${INCLIBTOOL}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/libtool-*.txz
fi

if [ "${INCLLVM}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/llvm-*.txz
  linkpackage ${SLACKPKGDIR}/l/spirv-llvm-translator-*.txz
fi

if [ "${INCLUA}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/lua-*.txz
fi

if [ "${INCLUAJIT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/luajit-*.txz
fi

if [ "${INCMFOUR}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/m4-*.txz
fi

if [ "${INCMAKE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/make-*.txz
fi

if [ "${INCMERCURIAL}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/mercurial-*.txz
fi

if [ "${INCNASM}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/nasm-*.txz
fi

if [ "${INCNINJA}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/ninja-*.txz
fi

if [ "${INCOPENCLHEADERS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/opencl-headers-*.txz
fi

if [ "${INCPTWOC}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/p2c-*.txz
fi

if [ "${INCPARALLEL}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/parallel-*.txz
fi

if [ "${INCPATCHELF}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/patchelf-*.txz
fi

if [ "${INCPKGCONF}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/pkgconf-*.txz
fi

if [ "${INCPMAKE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/pmake-*.txz
fi

if [ "${INCRETWOC}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/re2c-*.txz
fi

if [ "${INCRUST}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/rust-*.txz
fi

if [ "${INCSTRACE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/strace-*.txz
fi

if [ "${INCSUBVERSION}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/subversion-*.txz
fi

if [ "${INCSWIG}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/swig-*.txz
fi

if [ "${INCYASM}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/yasm-*.txz
fi

if [ "${INCEMACS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/e/emacs-*.txz
fi

if [ "${INCSIP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/sip-*.txz
fi

if [ "${INCVALGRIND}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/d/valgrind-*.txz
fi

linkpackage "${KERNELPKGDIR}/kernel-crippledsrc.xzm"
linkpackage "${KERNELPKGDIR}/kernel-headers.xzm"
echo -n "Using Kernel: "; echo "${KERNVERS}"
