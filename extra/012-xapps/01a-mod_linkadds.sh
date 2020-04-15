#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCANJUTA}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/gtksourceview/gtksourceview-3.24.9-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/libgda/libgda-5.2.5-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/gdl/gdl-3.28.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/anjuta/anjuta-3.28.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCBLUEFISH}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/bluefish/bluefish-1.0.7-${ARCH}-bksrc1.xzm"
fi

if [ "${INCBLUEFISHTWO}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/bluefish/bluefish-2.2.10-${ARCH}-bksrc1.xzm"
fi

if [ "${INCKHANSOUL}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/khansoul-2.0.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCETERM}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/Eterm/libast-0.7-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/Eterm/Eterm-0.9.6-${ARCH}-bksrc1.xzm"
fi

if [ "${INCEVINCE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/evince/evince-3.28.2-${ARCH}-bksrc1.xzm"
fi

if [ "${INCFBPANEL}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/fbpanel/fbpanel-6.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCFOX}" == "Y" ]; then
# XFE needs FOX
  linkpackage "${PACKAGESDIR}/fox/fox-1.6.57-${ARCH}-bksrc1.xzm"
fi

if [ "${INCGEANY}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/geany/geany-1.35-${ARCH}-bksrc1.xzm"
fi

if [ "${INCGHEX}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/ghex/ghex-3.18.3-${ARCH}-bksrc1.xzm"
fi

if [ "${INCGRAVEMAN}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/graveman/graveman-0.3.12-5-${ARCH}-bksrc1.xzm"
fi

if [ "${INCHSETROOT}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/hsetroot/hsetroot-1.0.2-${ARCH}-bksrc1.xzm"
fi

if [ "${INCIMLIBTWO}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/Eterm/imlib2-1.5.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCLIBGXPS}" == "Y" ]; then
# evince needs libgxps
  linkpackage "${PACKAGESDIR}/libgxps/libgxps-0.2.5-${ARCH}-bksrc1.xzm"
fi

if [ "${INCMEDIT}" == "Y" ]; then
# do we need txt2tags? or is that only for building?
#  linkpackage "${PACKAGESDIR}/txt2tags/txt2tags-20181126-x86_64-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/medit/medit-20190312-${ARCH}-bksrc1.xzm"
fi

if [ "${INCOBCONF}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/openbox/obconf-2.0.4-${ARCH}-bksrc1.xzm"
fi

if [ "${INCOPENBOX}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/openbox/openbox-3.6.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCQTFIVE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/qt5/qt5-5.13.2-${ARCH}-bksrc2.xzm"
fi

if [ "${INCSLOCK}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/slock/slock-1.4-${ARCH}-bksrc1.xzm"
fi

if [ "${INCST}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/st/st-0.8.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCTERMINATOR}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/terminator-1.91-${ARCH}-bksrc1.xzm"
fi

if [ "${INCTILDA}" == "Y" ]; then
# tilda needs libconfuse
# libconfuse could be moved to extra/009-xmodlibs once something else needs it
  linkpackage "${PACKAGESDIR}/libconfuse/libconfuse-3.2.2-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/tilda/tilda-1.4.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCVLC}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/libmpeg2/libmpeg2-0.5.1-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/libdvbpsi/libdvbpsi-1.3.2-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/vlc/vlc-3.0.8-${ARCH}-bksrc3.xzm"
fi

if [ "${INCWIRESHARK}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/portaudio/portaudio-v19-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/wireshark/wireshark-2.6.14-GTK2-${ARCH}-bksrc1.xzm"
fi

if [ "${INCXFE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/xfe/xfe-1.43.2-${ARCH}-bksrc1.xzm"
fi
