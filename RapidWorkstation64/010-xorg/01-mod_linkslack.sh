#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f *.txz *.xzm

linkpackage ${SLACKPKGDIR}/l/freetype-*.txz
linkpackage ${SLACKPKGDIR}/l/harfbuzz-*.txz
linkpackage ${SLACKPKGDIR}/l/graphite2-*.txz # harfbuzz requires graphite2

### FONTS ##############################
linkpackage ${SLACKPKGDIR}/ap/terminus-font-*.txz
linkpackage ${SLACKPKGDIR}/x/dejavu-fonts-ttf-*.txz
linkpackage ${SLACKPKGDIR}/x/font-cursor-misc-*.txz
linkpackage ${SLACKPKGDIR}/x/font-ibm-type1-*.txz
linkpackage ${SLACKPKGDIR}/x/font-micro-misc-*.txz
linkpackage ${SLACKPKGDIR}/x/font-misc-misc-*.txz
linkpackage ${SLACKPKGDIR}/x/font-mutt-misc-*.txz
linkpackage ${SLACKPKGDIR}/x/font-schumacher-misc-*.txz
linkpackage ${SLACKPKGDIR}/x/font-sun-misc-*.txz
linkpackage ${SLACKPKGDIR}/x/font-util-*.txz
linkpackage ${SLACKPKGDIR}/x/font-xfree86-type1-*.txz
linkpackage ${SLACKPKGDIR}/x/hack-fonts-ttf-*.txz
linkpackage ${SLACKPKGDIR}/x/liberation-fonts-ttf-*.txz
linkpackage ${SLACKPKGDIR}/x/noto-fonts-ttf-*.txz
linkpackage ${SLACKPKGDIR}/x/urw-core35-fonts-otf-*.txz
########################################

linkpackage ${SLACKPKGDIR}/x/encodings-*.txz
linkpackage ${SLACKPKGDIR}/x/fontconfig-*.txz
linkpackage ${SLACKPKGDIR}/x/iceauth-*.txz
linkpackage ${SLACKPKGDIR}/x/libICE-*.txz
linkpackage ${SLACKPKGDIR}/x/libSM-*.txz
linkpackage ${SLACKPKGDIR}/x/libX11-*.txz
linkpackage ${SLACKPKGDIR}/x/libXau-*.txz
linkpackage ${SLACKPKGDIR}/x/libXaw-*.txz
linkpackage ${SLACKPKGDIR}/x/libXdamage-*.txz
linkpackage ${SLACKPKGDIR}/x/libXdmcp-*.txz
linkpackage ${SLACKPKGDIR}/x/libXcursor-*.txz
linkpackage ${SLACKPKGDIR}/x/libXext-*.txz
linkpackage ${SLACKPKGDIR}/x/libXfixes-*.txz
linkpackage ${SLACKPKGDIR}/x/libXfont2-*.txz
linkpackage ${SLACKPKGDIR}/x/libXfontcache-*.txz
linkpackage ${SLACKPKGDIR}/x/libXft-*.txz
linkpackage ${SLACKPKGDIR}/x/libXi-*.txz
linkpackage ${SLACKPKGDIR}/x/libXinerama-*.txz
linkpackage ${SLACKPKGDIR}/x/libXmu-*.txz
linkpackage ${SLACKPKGDIR}/x/libXpm-*.txz
linkpackage ${SLACKPKGDIR}/x/libXrandr-*.txz
linkpackage ${SLACKPKGDIR}/x/libXrender-*.txz
linkpackage ${SLACKPKGDIR}/x/libXt-*.txz
linkpackage ${SLACKPKGDIR}/x/libXv-*.txz
linkpackage ${SLACKPKGDIR}/x/libXxf86vm-*.txz
linkpackage ${SLACKPKGDIR}/x/libdmx-*.txz
linkpackage ${SLACKPKGDIR}/x/libdrm-*.txz
linkpackage ${SLACKPKGDIR}/x/libfontenc-*.txz
linkpackage ${SLACKPKGDIR}/x/libpciaccess-*.txz
linkpackage ${SLACKPKGDIR}/x/libxcb-*.txz
linkpackage ${SLACKPKGDIR}/x/libxcvt-*.txz
linkpackage ${SLACKPKGDIR}/x/libxkbfile-*.txz
linkpackage ${SLACKPKGDIR}/x/libxshmfence-*.txz
linkpackage ${SLACKPKGDIR}/x/mkfontscale-*.txz
linkpackage ${SLACKPKGDIR}/x/pixman-*.txz
linkpackage ${SLACKPKGDIR}/x/util-macros-*.txz # What is this used for?
linkpackage ${SLACKPKGDIR}/x/x11-skel-*.txz
linkpackage ${SLACKPKGDIR}/x/xauth-*.txz
linkpackage ${SLACKPKGDIR}/x/xhost-*.txz
linkpackage ${SLACKPKGDIR}/x/xisxwayland-*.txz
linkpackage ${SLACKPKGDIR}/x/xorg-server-??.?.*-*.txz
linkpackage ${SLACKPKGDIR}/x/xorgproto-*.txz
linkpackage ${SLACKPKGDIR}/x/xrandr-*.txz
linkpackage ${SLACKPKGDIR}/x/xrdb-*.txz
linkpackage ${SLACKPKGDIR}/x/xterm-*.txz

if [ "${INCLIBXKBCOMMON}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libxkbcommon-*.txz
fi

if [ "${INCWAYLAND}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/wayland-protocols-*.txz
  linkpackage ${SLACKPKGDIR}/x/wayland-?.??.*-*.txz
  linkpackage ${SLACKPKGDIR}/x/xorg-server-xwayland-*.txz
fi

if [ "${INCXDESKTOPENVIRONMENT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/libXtst-*.txz
  linkpackage ${SLACKPKGDIR}/x/libevdev-*.txz
  linkpackage ${SLACKPKGDIR}/a/libgudev-*.txz
  linkpackage ${SLACKPKGDIR}/x/libinput-*.txz
  linkpackage ${SLACKPKGDIR}/x/libwacom-*.txz
  linkpackage ${SLACKPKGDIR}/x/mtdev-*.txz
  linkpackage ${SLACKPKGDIR}/x/xev-*.txz
  linkpackage ${SLACKPKGDIR}/x/xinit-*.txz
  linkpackage ${SLACKPKGDIR}/x/xinput-*.txz
  linkpackage ${SLACKPKGDIR}/x/xkbcomp-*.txz
  linkpackage ${SLACKPKGDIR}/x/xkeyboard-config-*.txz
  for PKG in ${SLACKPKGDIR}/x/xf86-input-*.txz; do linkpackage ${PKG}; done

  linkpackage ${SLACKPKGDIR}/x/xf86-video-vesa-*.txz
fi

if [ "${INCXF86VIDEOAMDGPU}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xf86-video-amdgpu-*.txz
fi

if [ "${INCXF86VIDEOAST}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xf86-video-ast-*.txz
fi

if [ "${INCXF86VIDEOATI}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xf86-video-ati-*.txz
fi

if [ "${INCXF86VIDEOINTEL}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xf86-video-intel-*.txz
  linkpackage ${SLACKPKGDIR}/x/intel-vaapi-driver-*.txz
fi

if [ "${INCXF86VIDEOMGA}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xf86-video-mga-*.txz
fi

if [ "${INCXF86VIDEONOUVEAU}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xf86-video-nouveau-*.txz
fi

if [ "${INCXF86VIDEOVMWARE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xf86-video-vmware-*.txz
fi

if [ "${INCADOBEFONTS}" == "Y" ]; then
  for PKG in ${SLACKPKGDIR}/x/font-adobe-*.txz; do linkpackage ${PKG}; done
fi

if [ "${INCBHFONTS}" == "Y" ]; then
  for PKG in ${SLACKPKGDIR}/x/font-bh-*.txz; do linkpackage ${PKG}; done
fi

if [ "${INCBITSTREAMFONTS}" == "Y" ]; then
  for PKG in ${SLACKPKGDIR}/x/font-bitstream-*.txz; do linkpackage ${PKG}; done
fi

if [ "${INCGHOSTSCRIPT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/ghostscript-??.*.txz
  linkpackage ${SLACKPKGDIR}/ap/ghostscript-fonts-std-*.txz
  linkpackage ${SLACKPKGDIR}/l/libpaper-*.txz
fi

if [ "${INCLIBXKLAVIER}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libxklavier-*.txz
fi

if [ "${INCLIBXPRESENT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/libXpresent-*.txz
fi

if [ "${INCLIBXRES}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/libXres-*.txz
fi

if [ "${INCMESA}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/freeglut-*.txz
  linkpackage ${SLACKPKGDIR}/x/glew-*.txz
  linkpackage ${SLACKPKGDIR}/x/glu-*.txz
  linkpackage ${SLACKPKGDIR}/x/libepoxy-*.txz
  linkpackage ${SLACKPKGDIR}/x/libglvnd-*.txz
  linkpackage ${SLACKPKGDIR}/x/mesa-*.txz
fi

if [ "${INCLIBVA}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/libva-?.*-*.txz
fi

if [ "${INCLIBVDPAU}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/libvdpau-*.txz
fi

if [ "${INCXCBUTIL}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xcb-util-?.?.?-*.txz
# linkpackage ${SLACKPKGDIR}/x/xcb-util-errors-1.0-x86_64-1.txz
# linkpackage ${SLACKPKGDIR}/x/xcb-util-cursor-0.1.3-x86_64-1.txz
fi

if [ "${INCXCBUTILIMAGE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xcb-util-image-?.?.?-*.txz
fi

if [ "${INCXCBUTILKEYSYMS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xcb-util-keysyms-?.?.?-*.txz
fi

if [ "${INCXCBUTILRENDERUTIL}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xcb-util-renderutil-?.?.*-*.txz
fi

if [ "${INCXCBUTILWM}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xcb-util-wm-?.?.?-*.txz
fi

if [ "${INCLIBXAW3DXFT}" == "Y" ]; then
#  linkpackage ${SLACKPKGDIR}/x/libXaw3d-*.txz
  linkpackage ${SLACKPKGDIR}/x/libXaw3dXft-*.txz
fi

if [ "${INCLIBXCOMPOSITE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/libXcomposite-*.txz
fi

if [ "${INCLIBXVMC}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/libXvMC-*.txz
fi

if [ "${INCLIBXXF86DGA}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/libXxf86dga-*.txz
#  linkpackage ${SLACKPKGDIR}/x/xf86dga-*.txz
fi

if [ "${INCLIBXXF86MISC}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/libXxf86misc-*.txz
fi

if [ "${INCLIBXSCRNSAVER}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/libXScrnSaver-*.txz
fi

if [ "${INCMAKEDEPEND}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/makedepend-*.txz
fi

if [ "${INCMOTIF}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/motif-*.txz
fi

if [ "${INCSETXKBMAP}" == "Y" ]; then
# Necessary to switch to DVORAK keyboard map
  linkpackage ${SLACKPKGDIR}/x/setxkbmap-*.txz
fi

if [ "${INCTRANSSET}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/transset-*.txz
fi

if [ "${INCXBACKLIGHT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xbacklight-*.txz
fi

if [ "${INCXCALC}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xcalc-*.txz
fi

if [ "${INCXDG}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xdg-user-dirs-*.txz
  linkpackage ${SLACKPKGDIR}/x/xdg-utils-*.txz
fi

if [ "${INCXDPYINFO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xdpyinfo-*.txz
fi

if [ "${INCXDRIINFO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xdriinfo-*.txz
fi

if [ "${INCXKILL}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xkill-*.txz
fi

if [ "${INCXMAN}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xman-*.txz
fi

if [ "${INCXMESSAGE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xmessage-*.txz
fi

if [ "${INCXMODMAP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xmodmap-*.txz
fi

if [ "${INCXMORE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xmore-*.txz
fi

if [ "${INCXPROP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xprop-*.txz
fi

if [ "${INCXSET}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xset-*.txz
fi

if [ "${INCXSETROOT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xsetroot-*.txz
fi

if [ "${INCXVINFO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xvinfo-*.txz
fi

if [ "${INCXWD}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xwd-*.txz
  linkpackage ${SLACKPKGDIR}/x/xwud-*.txz
fi

if [ "${INCXWININFO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/xwininfo-*.txz
fi

if [ "${INCIGTGPUTOOLS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/igt-gpu-tools-*.txz
fi

if [ "${INCVULKANSDK}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/vulkan-sdk-*.txz
fi
