#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCFTPSYNC}" == "Y" ]; then
# ftpsync needs File-Listing
# File-Listing needs HTTP-Date
  linkpackage "${PACKAGESDIR}/perl_mods/HTTP-Date-6.02-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/perl_mods/File-Listing-6.04-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/perl_mods/ftpsync-20180521-noarch-bksrc1.xzm"
fi

if [ "${INCJEDI}" == "Y" ]; then
# jedi needs backports.shutil_get_terminal_size
  linkpackage "${PACKAGESDIR}/python_mods/backports.shutil_get_terminal_size-1.0.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/jedi-0.12.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCJUPYTER}" == "Y" ]; then
# ipykernel needs tornado, jupyter_client, ipython, ptyprocess, pyzmq
# ipython needs traitlets, decorator, Pygments, pexpect, prompt_toolkit1, pickleshare, simplegeneric
  linkpackage "${PACKAGESDIR}/python_mods/Pygments-2.1.3-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/decorator-4.3.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/pexpect-4.6.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/ptyprocess-0.6.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/scandir-1.9.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/simplegeneric-0.8.1-${ARCH}-bksrc1.xzm"

  linkpackage "${PACKAGESDIR}/python_mods/ipykernel-4.9.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/ipython-5.8.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/jupyter_console-5.2.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/jupyter_client-5.2.3-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/jupyter_core-4.4.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCKEEPNOTE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/keepnote-0.7.8-${ARCH}-bksrc1.xzm"
fi

if [ "${INCNUMPY}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/numpy-1.15.2-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPASTEBINIT}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/pastebinit-1.5-noarch-bksrc1.xzm"
fi

if [ "${INCPICKLESHARE}" == "Y" ]; then
# pickleshare needs pathlib2
  linkpackage "${PACKAGESDIR}/python_mods/pathlib2-2.3.2-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/pickleshare-0.7.4-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPROMPTTOOLKIT}" == "Y" ]; then
# prompt_toolkit1 needs wcwidth
  linkpackage "${PACKAGESDIR}/python_mods/wcwidth-0.1.7-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/prompt_toolkit-1.0.15-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPYXDG}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/pyxdg-0.26-noarch-bksrc1.xzm"
fi

if [ "${INCPYZMQ}" == "Y" ]; then
# pyzmq needs zmq,Cython
  linkpackage "${PACKAGESDIR}/python_mods/pyzmq-17.1.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCTRAITLETS}" == "Y" ]; then
# traitlets needs enum34, six, ipython_genutils
  linkpackage "${PACKAGESDIR}/python_mods/enum34-1.1.6-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/ipython_genutils-0.2.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/traitlets-4.3.2-${ARCH}-bksrc1.xzm"
fi

if [ "${INCWEBSOCKIFY}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/websockify-20180531-noarch-bksrc1.xzm"
fi
