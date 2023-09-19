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

if [ "${INCETERM}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/Eterm/libast-0.7-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/Eterm/Eterm-0.9.6-${ARCH}-bksrc1.xzm"
fi

if [ "${INCEVINCE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/evince/evince-3.36.11-${ARCH}-bksrc1.xzm"
fi

if [ "${INCFBPANEL}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/fbpanel/fbpanel-6.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCFOX}" == "Y" ]; then
# XFE needs FOX
  linkpackage "${PACKAGESDIR}/fox/fox-1.6.57-${ARCH}-bksrc1.xzm"
fi

if [ "${INCGEANY}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/geany/geany-1.38-${ARCH}-bksrc1.xzm"
fi

if [ "${INCGHEX}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/ghex/ghex-3.18.3-${ARCH}-bksrc1.xzm"
fi

if [ "${INCGRAVEMAN}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/graveman/graveman-0.3.12-5-${ARCH}-bksrc2.xzm"
fi

if [ "${INCHSETROOT}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/hsetroot/hsetroot-1.0.2-${ARCH}-bksrc1.xzm"
fi

if [ "${INCIMLIBTWO}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/Eterm/imlib2-1.5.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCKITTY}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/kitty/kitty-0.27.1-x86_64-1.xzm"
fi

if [ "${INCLIBASS}" == "Y" ]; then
# vlc needs libass
  linkpackage "${PACKAGESDIR}/libass/libass-0.14.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCLIBGXPS}" == "Y" ]; then
# evince needs libgxps
  linkpackage "${PACKAGESDIR}/libgxps/libgxps-0.2.5-${ARCH}-bksrc1.xzm"
fi

if [ "${INCMPV}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/mpv/mpv-0.36.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCOBCONF}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/openbox/obconf-2.0.4-${ARCH}-bksrc1.xzm"
fi

if [ "${INCOPENBOX}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/openbox/openbox-3.6.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCRECORDMYDESKTOP}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/recordmydesktop/recordmydesktop-0.3.8.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCSLOCK}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/slock/slock-1.4-${ARCH}-bksrc1.xzm"
fi

if [ "${INCST}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/st/st-0.8.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCVLC}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/libmpeg2/libmpeg2-0.5.1-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/libdvbpsi/libdvbpsi-1.3.2-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/microdns/microdns-0.2.0-${ARCH}-bksrc1.xzm"
#  linkpackage "${PACKAGESDIR}/vlc/vlc-3.0.17.3-${ARCH}-bksrc1.xzm"
fi

if [ "${INCWIRESHARK}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/libsmi/libsmi-0.5.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/portaudio/portaudio-v19-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/spandsp/spandsp-0.0.6-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/wireshark/wireshark-3.6.12-${ARCH}-bksrc1.xzm"
fi

if [ "${INCXAUTOLOCK}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/xautolock/xautolock-2.2-${ARCH}-bksrc1.xzm"
fi

if [ "${INCXFE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/xfe/xfe-1.43.2-${ARCH}-bksrc1.xzm"
fi
