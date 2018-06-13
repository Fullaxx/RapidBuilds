#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f *.txz *.xzm

# Some default fonts to get things working
ln -s ${SLACKPKGDIR}/l/freetype-*.txz
ln -s ${SLACKPKGDIR}/l/harfbuzz-*.txz
ln -s ${SLACKPKGDIR}/x/dejavu-fonts-ttf-*.txz
ln -s ${SLACKPKGDIR}/x/liberation-fonts-ttf-*.txz
ln -s ${SLACKPKGDIR}/x/urw-core35-fonts-otf-*.txz
#######################################

ln -s ${SLACKPKGDIR}/x/fontconfig-*.txz
ln -s ${SLACKPKGDIR}/x/iceauth-*.txz
ln -s ${SLACKPKGDIR}/x/libICE-*.txz
ln -s ${SLACKPKGDIR}/x/libSM-*.txz
ln -s ${SLACKPKGDIR}/x/libX11-*.txz
ln -s ${SLACKPKGDIR}/x/libXau-*.txz
ln -s ${SLACKPKGDIR}/x/libXaw-*.txz
ln -s ${SLACKPKGDIR}/x/libXdamage-*.txz
ln -s ${SLACKPKGDIR}/x/libXdmcp-*.txz
ln -s ${SLACKPKGDIR}/x/libXcursor-*.txz
ln -s ${SLACKPKGDIR}/x/libXext-*.txz
ln -s ${SLACKPKGDIR}/x/libXfixes-*.txz
ln -s ${SLACKPKGDIR}/x/libXfont2-*.txz
ln -s ${SLACKPKGDIR}/x/libXfontcache-*.txz
ln -s ${SLACKPKGDIR}/x/libXft-*.txz
ln -s ${SLACKPKGDIR}/x/libXi-*.txz
ln -s ${SLACKPKGDIR}/x/libXinerama-*.txz
ln -s ${SLACKPKGDIR}/x/libXmu-*.txz
ln -s ${SLACKPKGDIR}/x/libXpm-*.txz
ln -s ${SLACKPKGDIR}/x/libXrandr-*.txz
ln -s ${SLACKPKGDIR}/x/libXrender-*.txz
ln -s ${SLACKPKGDIR}/x/libXt-*.txz
ln -s ${SLACKPKGDIR}/x/libXv-*.txz
ln -s ${SLACKPKGDIR}/x/libXxf86vm-*.txz
ln -s ${SLACKPKGDIR}/x/libdmx-*.txz
ln -s ${SLACKPKGDIR}/x/libdrm-*.txz
ln -s ${SLACKPKGDIR}/x/libfontenc-*.txz
ln -s ${SLACKPKGDIR}/x/libpciaccess-*.txz
ln -s ${SLACKPKGDIR}/x/libxcb-*.txz
ln -s ${SLACKPKGDIR}/x/libxkbfile-*.txz
ln -s ${SLACKPKGDIR}/x/libxshmfence-*.txz
ln -s ${SLACKPKGDIR}/x/mkfontdir-*.txz
ln -s ${SLACKPKGDIR}/x/mkfontscale-*.txz
ln -s ${SLACKPKGDIR}/x/pixman-*.txz
ln -s ${SLACKPKGDIR}/x/util-macros-*.txz # What is this used for?
ln -s ${SLACKPKGDIR}/x/x11-skel-*.txz
ln -s ${SLACKPKGDIR}/x/xauth-*.txz
ln -s ${SLACKPKGDIR}/x/xhost-*.txz
ln -s ${SLACKPKGDIR}/x/xorg-server-?.??.?-*.txz || exit 1
ln -s ${SLACKPKGDIR}/x/xorgproto-*.txz
ln -s ${SLACKPKGDIR}/x/xrandr-*.txz
ln -s ${SLACKPKGDIR}/x/xrdb-*.txz
ln -s ${SLACKPKGDIR}/x/xterm-*.txz

if [ "${INCXDESKTOPENVIRONMENT}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/libXtst-*.txz
  ln -s ${SLACKPKGDIR}/x/libevdev-*.txz
  ln -s ${SLACKPKGDIR}/a/libgudev-*.txz
  ln -s ${SLACKPKGDIR}/x/libinput-*.txz
  ln -s ${SLACKPKGDIR}/x/libwacom-*.txz
  ln -s ${SLACKPKGDIR}/x/mtdev-*.txz
  ln -s ${SLACKPKGDIR}/x/xev-*.txz
  ln -s ${SLACKPKGDIR}/x/xinit-*.txz
  ln -s ${SLACKPKGDIR}/x/xinput-*.txz
  ln -s ${SLACKPKGDIR}/x/xkbcomp-*.txz
  ln -s ${SLACKPKGDIR}/x/xkeyboard-config-*.txz
  for PKG in ${SLACKPKGDIR}/x/xf86-input-*.txz; do ln -s ${PKG}; done

  ln -s ${SLACKPKGDIR}/x/xf86-video-vesa-*.txz
  ln -s ${SLACKPKGDIR}/x/xf86-video-cirrus-*.txz
  ln -s ${SLACKPKGDIR}/x/xf86-video-vboxvideo-*.txz
  ln -s ${SLACKPKGDIR}/x/xf86-video-v4l-*.txz
fi

if [ "${INCXF86VIDEOAMDGPU}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/xf86-video-amdgpu-*.txz
fi

if [ "${INCXF86VIDEOAST}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/xf86-video-ast-*.txz
fi

if [ "${INCXF86VIDEOATI}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/xf86-video-ati-*.txz
fi

if [ "${INCXF86VIDEOINTEL}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/xf86-video-intel-*.txz
  ln -s ${SLACKPKGDIR}/x/intel-vaapi-driver-*.txz
fi

if [ "${INCXF86VIDEOMGA}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/xf86-video-mga-*.txz
fi

if [ "${INCXF86VIDEONOUVEAU}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/xf86-video-nouveau-*.txz
fi

if [ "${INCXF86VIDEOVMWARE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/xf86-video-vmware-*.txz
fi

if [ "${INCADOBEFONTS}" == "Y" ]; then
  for PKG in ${SLACKPKGDIR}/x/font-adobe-*.txz; do ln -s ${PKG}; done
fi

if [ "${INCBHFONTS}" == "Y" ]; then
  for PKG in ${SLACKPKGDIR}/x/font-bh-*.txz; do ln -s ${PKG}; done
fi

if [ "${INCBITSTREAMFONTS}" == "Y" ]; then
  for PKG in ${SLACKPKGDIR}/x/font-bitstream-*.txz; do ln -s ${PKG}; done
fi

if [ "${INCGHOSTSCRIPT}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/ghostscript-?.*.txz || exit 1
  ln -s ${SLACKPKGDIR}/ap/ghostscript-fonts-std-*.txz
fi

#if [ "${INCALLXFONTS}" == "Y" ]; then
#  ln -s ${SLACKPKGDIR}/x/sazanami-fonts-ttf-*.txz
#  ln -s ${SLACKPKGDIR}/x/sinhala_lklug-font-ttf-*.txz
#  ln -s ${SLACKPKGDIR}/x/tibmachuni-font-ttf-*.txz
#  ln -s ${SLACKPKGDIR}/x/ttf-indic-fonts-*.txz
#  ln -s ${SLACKPKGDIR}/x/ttf-tlwg-*.txz
#  ln -s ${SLACKPKGDIR}/x/wqy-zenhei-font-ttf-*.txz
#  for PKG in ${SLACKPKGDIR}/x/font-*.txz; do ln -s ${PKG}; done
#fi

if [ "${INCLIBXKLAVIER}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/libxklavier-*.txz
fi

if [ "${INCLIBXRES}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/libXres-*.txz
fi

if [ "${INCMESA}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/freeglut-*.txz
  ln -s ${SLACKPKGDIR}/x/glew-*.txz
  ln -s ${SLACKPKGDIR}/x/glu-*.txz
  ln -s ${SLACKPKGDIR}/x/libepoxy-*.txz
  ln -s ${SLACKPKGDIR}/x/mesa-*.txz
fi

if [ "${INCLIBVA}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/libva-?.?.?-*.txz || exit 1
fi

if [ "${INCLIBVDPAU}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/libvdpau-*.txz
fi

if [ "${INCXCBUTIL}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/xcb-util-?.?.?-*.txz || exit 1
# ln -s ${SLACKPKGDIR}/x//xcb-util-image-0.4.0-x86_64-2.txz
# ln -s ${SLACKPKGDIR}/x//xcb-util-keysyms-0.4.0-x86_64-2.txz
# ln -s ${SLACKPKGDIR}/x//xcb-util-wm-0.4.1-x86_64-2.txz
# ln -s ${SLACKPKGDIR}/x//xcb-util-errors-1.0-x86_64-1.txz
# ln -s ${SLACKPKGDIR}/x/xcb-util-renderutil-0.3.9-x86_64-2.txz
# ln -s ${SLACKPKGDIR}/x/xcb-util-cursor-0.1.3-x86_64-1.txz
fi

if [ "${INCLIBXAW3DXFT}" == "Y" ]; then
#  ln -s ${SLACKPKGDIR}/x/libXaw3d-*.txz
  ln -s ${SLACKPKGDIR}/x/libXaw3dXft-*.txz
fi

if [ "${INCLIBXCOMPOSITE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/libXcomposite-*.txz
fi

if [ "${INCLIBXVMC}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/libXvMC-*.txz
fi

if [ "${INCLIBXXF86DGA}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/libXxf86dga-*.txz
#  ln -s ${SLACKPKGDIR}/x/xf86dga-*.txz
fi

if [ "${INCLIBXXF86MISC}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/libXxf86misc-*.txz
fi

if [ "${INCLIBXSCRNSAVER}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/libXScrnSaver-*.txz
fi

if [ "${INCMAKEDEPEND}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/makedepend-*.txz
fi

if [ "${INCMOTIF}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/motif-*.txz
fi

if [ "${INCTRANSSET}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/transset-*.txz
fi

if [ "${INCXBACKLIGHT}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/xbacklight-*.txz
fi

if [ "${INCXCALC}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/xcalc-*.txz
fi

if [ "${INCXDG}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/xdg-user-dirs-*.txz
  ln -s ${SLACKPKGDIR}/x/xdg-utils-*.txz
fi

if [ "${INCXDPYINFO}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/xdpyinfo-*.txz
fi

if [ "${INCXDRIINFO}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/xdriinfo-*.txz
fi

if [ "${INCXKILL}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/xkill-*.txz
fi

if [ "${INCXMAN}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/xman-*.txz
fi

if [ "${INCXMESSAGE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/xmessage-*.txz
fi

if [ "${INCXMORE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/xmore-*.txz
fi

if [ "${INCXPROP}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/xprop-*.txz
fi

if [ "${INCXSET}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/xset-*.txz
fi

if [ "${INCXSETROOT}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/xsetroot-*.txz
fi

if [ "${INCXKBMAP}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/setxkbmap-*.txz
fi

if [ "${INCXVINFO}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/xvinfo-*.txz
fi

if [ "${INCXWD}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/xwd-*.txz
  ln -s ${SLACKPKGDIR}/x/xwud-*.txz
fi

if [ "${INCXWININFO}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/xwininfo-*.txz
fi

if [ "${INCINTELGPUTOOLS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/intel-gpu-tools-*.txz
fi
