#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f *.txz *.xzm

### Desktop Environments ##############
if [ "${INCBLACKBOX}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/xap/blackbox-*.txz
fi

if [ "${INCFLUXBOX}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/xap/fluxbox-*.txz
fi

if [ "${INCXFCE}" == "Y" ]; then
  for XFCEPKG in ${SLACKPKGDIR}/xfce/*.txz; do ln -s ${XFCEPKG}; done
  rm orage-*.txz #orage needs ical
  rm tumbler-*.txz # tumbler reqs gstreamer,poppler
  rm xfce4-power-manager-*.txz # xfce4-power-manager needs upower
  rm xfce4-pulseaudio-plugin-*.txz
  rm xfce4-screenshooter-*.txz
  rm xfce4-settings-*.txz
  rm xfce4-systemload-plugin-*.txz
  rm xfce4-weather-plugin-*.txz
  rm xfce4-dev-tools-*.txz
fi
if [ "${INCXFCETUMBLER}" == "Y" ]; then
# tumbler needs gstreamer,poppler
  ln -s ${SLACKPKGDIR}/xfce/tumbler-*.txz
fi
if [ "${INCXFCEPOWERMANAGER}" == "Y" ]; then
# xfce4-power-manager needs upower
  ln -s ${SLACKPKGDIR}/xfce/xfce4-power-manager-*.txz
fi
if [ "${INCXFCESCREENSHOOTER}" == "Y" ]; then
# xfce4-screenshooter needs libsoup
  ln -s ${SLACKPKGDIR}/xfce/xfce4-screenshooter-*.txz
fi
if [ "${INCXFCESETTINGS}" == "Y" ]; then
# xfce4-settings needs upower
  ln -s ${SLACKPKGDIR}/xfce/xfce4-settings-*.txz
fi
### Desktop Environments ##############

### Apps ##############################
if [ "${INCAUDACIOUS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/xap/audacious-?.*.txz || exit 1
  ln -s ${SLACKPKGDIR}/xap/audacious-plugins-*.txz
fi

if [ "${INCGFTP}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/xap/gftp-*.txz
fi

if [ "${INCGIMP}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/xap/gimp-*.txz
fi

if [ "${INCGKRELLM}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/xap/gkrellm-*.txz
fi

if [ "${INCGPARTED}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/xap/gparted-*.txz
fi

if [ "${INCHEXCHAT}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/xap/hexchat-*.txz
fi

if [ "${INCMOZILLAFIREFOX}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/xap/mozilla-firefox-*.txz
fi

if [ "${INCMOZILLATHUNDERBIRD}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/xap/mozilla-thunderbird-*.txz
fi

if [ "${INCMPLAYER}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/xap/MPlayer-*.txz
fi

if [ "${INCRDESKTOP}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/xap/rdesktop-*.txz
fi

if [ "${INCRXVTUNICODE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/xap/rxvt-unicode-*.txz
fi

if [ "${INCXINE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/xap/xine-ui-*.txz
  ln -s ${SLACKPKGDIR}/xap/xine-lib-*.txz
fi

if [ "${INCXLOCK}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/xap/xlockmore-*.txz
fi

if [ "${INCXMMS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/xap/xmms-*.txz
fi

if [ "${INCXPAINT}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/xap/xpaint-*.txz
fi

if [ "${INCXPDF}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/xap/xpdf-*.txz
fi

if [ "${INCTIGERVNC}" == "Y" ]; then
  linkmodule ${SLACKEXTRA}/tigervnc/tigervnc-*.txz
fi

if [ "${INCFLTK}" == "Y" ]; then
  linkmodule ${SLACKEXTRA}/fltk/fltk-*.txz
fi
### Apps ##############################

### Themes ############################
if [ "${INCADWAITAICONTHEME}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/adwaita-icon-theme-*.txz
fi

if [ "${INCGNOMETHEMESSTANDARD}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/gnome-themes-standard-*.txz
fi

if [ "${INCHICOLORICONTHEME}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/hicolor-icon-theme-*.txz
fi

if [ "${INCGSETTINGSDESLTOPSCHEMAS}" == "Y" ]; then
# Evince needs gsettings-desktop-schemas
  ln -s ${SLACKPKGDIR}/l/gsettings-desktop-schemas-*.txz
fi
### Themes ############################

### Libraries #########################
# XXX FIXME
if [ "${INCMMPACKAGE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/glibmm-*.txz
  ln -s ${SLACKPKGDIR}/l/gtkmm2-*.txz
  ln -s ${SLACKPKGDIR}/l/gtkmm3-*.txz
  ln -s ${SLACKPKGDIR}/l/atkmm-*.txz
  ln -s ${SLACKPKGDIR}/l/cairomm-*.txz
  ln -s ${SLACKPKGDIR}/l/pangomm-*.txz
fi
# XXX FIXME

if [ "${INCAFIFTYTWO}" == "Y" ]; then
# MPlayer needs liba52
  ln -s ${SLACKPKGDIR}/l/a52dec-*.txz
fi

if [ "${INCAALIB}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/aalib-*.txz
fi

if [ "${INCATK}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/atk-*.txz
  ln -s ${SLACKPKGDIR}/l/at-spi2-atk-*.txz
  ln -s ${SLACKPKGDIR}/l/at-spi2-core-*.txz
fi

if [ "${INCATKMM}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/atkmm-*.txz
fi

if [ "${INCAUDIOFILE}" == "Y" ]; then
# esounds needs audiofile
  ln -s ${SLACKPKGDIR}/l/audiofile-*.txz
fi

if [ "${INCBABL}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/babl-*.txz
fi

if [ "${INCCAIRO}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/cairo-*.txz
fi

if [ "${INCCAIROMM}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/cairomm-*.txz
fi

if [ "${INCDJVULIBRE}" == "Y" ]; then
# imagemagick needs djvulibre
  ln -s ${SLACKPKGDIR}/l/djvulibre-*.txz
fi

if [ "${INCESOUND}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/esound-*.txz
fi

if [ "${INCFLAC}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/flac-*.txz
fi

if [ "${INCFFMPEG}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/ffmpeg-*.txz
fi

if [ "${INCFLUIDSYNTH}" == "Y" ]; then
# audacious wants fluidsynth
  ln -s ${SLACKPKGDIR}/l/fluidsynth-*.txz
fi

if [ "${INCFRIBIDI}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/fribidi-*.txz
fi

if [ "${INCGCONF}" == "Y" ]; then
# mplayer,Chrome need GConf
  ln -s ${SLACKPKGDIR}/l/GConf-*.txz
fi

if [ "${INCGD}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/gd-*.txz
fi

if [ "${INCGDK}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/gdk-pixbuf2-*.txz
fi

if [ "${INCGEGL}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/gegl-*.txz
fi

if [ "${INCGIFLIB}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/giflib-*.txz
fi

if [ "${INCGLADETHREE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/glade3-*.txz
fi

if [ "${INCGLIBMM}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/glibmm-*.txz
fi

if [ "${INCGSTREAMER}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/gstreamer-*.txz
fi

if [ "${INCGTKMMTWO}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/gtkmm2-*.txz
fi

if [ "${INCGTKMMTHREE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/gtkmm3-*.txz
fi

if [ "${INCGTKONE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/gtk+-1.2.10-*.txz || exit 1
fi

if [ "${INCGTKTWO}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/gtk+2-*.txz
fi

if [ "${INCGTKTHREE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/gtk+3-*.txz
fi

if [ "${INCILMBASE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/ilmbase-*.txz
fi

if [ "${INCIMAGEMAGICK}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/imagemagick-*.txz
fi

if [ "${INCJASPER}" == "Y" ]; then
# GIMP,libraw,imagemagick need jasper
  ln -s ${SLACKPKGDIR}/l/jasper-*.txz
fi

if [ "${INCLAME}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/lame-*.txz
fi

if [ "${INCLCMS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/lcms-*.txz
fi

if [ "${INCLCMSTWO}" == "Y" ]; then
# openjpeg,imagemagick needs lcms2
  ln -s ${SLACKPKGDIR}/l/lcms2-*.txz
fi

if [ "${INCLIBBLURAY}" == "Y" ]; then
# MPlayer needs libbluray
  ln -s ${SLACKPKGDIR}/l/libbluray-*.txz
fi

if [ "${INCLIBCACA}" == "Y" ]; then
# MPlayer needs libcaca
  ln -s ${SLACKPKGDIR}/l/libcaca-*.txz
fi

if [ "${INCLIBCANBERRA}" == "Y" ]; then
# hexchat needs libcanberra
  ln -s ${SLACKPKGDIR}/l/libcanberra-*.txz
fi

if [ "${INCCDDB}" == "Y" ]; then
# Audacious,paranoia need libcddb
  ln -s ${SLACKPKGDIR}/l/libcddb-*.txz
fi

if [ "${INCCDIO}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/libcdio-?.?.?-*.txz || exit 1
# libcdio-paranoia holds libcdio_cdda.so.?.?.?, it also wants libcddb
  ln -s ${SLACKPKGDIR}/l/libcdio-paranoia-*.txz
fi

if [ "${INCLIBDVDNAV}" == "Y" ]; then
# MPlayer needs libdvdnav
  ln -s ${SLACKPKGDIR}/l/libdvdnav-*.txz
fi

if [ "${INCLIBDVDREAD}" == "Y" ]; then
# MPlayer needs libdvdread
  ln -s ${SLACKPKGDIR}/l/libdvdread-*.txz
fi

if [ "${INCLIBEXIF}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/libexif-*.txz
fi

if [ "${INCLIBJPEGTURBO}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/libjpeg-turbo-*.txz
fi

if [ "${INCLIBMAD}" == "Y" ]; then
# mplayer need libmad
  ln -s ${SLACKPKGDIR}/l/libmad-*.txz
fi

if [ "${INCLIBMNG}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/libmng-*.txz
fi

if [ "${INCLIBNOTIFY}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/libnotify-*.txz
fi

if [ "${INCLIBOGG}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/libogg-*.txz
fi

if [ "${INCLIBPNG}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/libpng-*.txz
fi

if [ "${INCLIBPTHREADSTUBS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/x/libpthread-stubs-*.txz
fi

if [ "${INCLIBRAW}" == "Y" ]; then
# imagemagick needs libraw
  ln -s ${SLACKPKGDIR}/l/LibRaw-*.txz
fi

if [ "${INCLIBRSVG}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/librsvg-*.txz
fi

if [ "${INCLIBSNDFILE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/libsndfile-*.txz
fi

if [ "${INCLIBTHEORA}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/libtheora-*.txz
fi

if [ "${INCLIBVORBIS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/libvorbis-*.txz
fi

if [ "${INCLIBWEBP}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/libwebp-*.txz
fi

if [ "${INCLIBWNCK}" == "Y" ]; then
# xfce4-panel needs libwnck
  ln -s ${SLACKPKGDIR}/l/libwnck-*.txz
fi

if [ "${INCLIBWMF}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/libwmf-?.*.txz || exit 1
# ln -s ${SLACKPKGDIR}/l/libwmf-docs-*.txz
fi

if [ "${INCOPENCL}" == "Y" ]; then
# imagemagick needs OpenCL
  ln -s ${SLACKPKGDIR}/l/ocl-icd-*.txz
fi

if [ "${INCOPENEXR}" == "Y" ]; then
# GIMP,GEGL,imagemagick need openexr
  ln -s ${SLACKPKGDIR}/l/openexr-*.txz
fi

if [ "${INCOPUS}" == "Y" ]; then
# GIMP,GEGL,imagemagick need openexr
  ln -s ${SLACKPKGDIR}/l/opus-*.txz
fi

if [ "${INCOPENJPEG}" == "Y" ]; then
# Evince, ffmpeg, vlc
  ln -s ${SLACKPKGDIR}/l/openjpeg-*.txz
fi

if [ "${INCORC}" == "Y" ]; then
# gstreamer needs orc
  ln -s ${SLACKPKGDIR}/l/orc-*.txz
fi

if [ "${INCPANGO}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/pango-*.txz
fi

if [ "${INCPANGOMM}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/pangomm-*.txz
fi

if [ "${INCPOPPLER}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/poppler-?.*.txz || exit 1
  ln -s ${SLACKPKGDIR}/l/poppler-data-*.txz
fi

if [ "${INCPULSE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/pulseaudio-*.txz
  ln -s ${SLACKPKGDIR}/l/libasyncns-*.txz
  ln -s ${SLACKPKGDIR}/l/sbc-*.txz
fi

if [ "${INCQT}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/qt-*.txz
  ln -s ${SLACKPKGDIR}/l/PyQt-*.txz
  ln -s ${SLACKPKGDIR}/l/polkit-qt-?-*.txz
fi

if [ "${INCSDL}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/sdl-*.txz
fi

# Sun Mar 19 05:27:13 UTC 2017 (ffmpeg now includes ffplay, which required the SDL2 libraries.)
if [ "${INCSDLTWO}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/SDL2-*.txz
  ln -s ${SLACKPKGDIR}/l/SDL2_gfx-*.txz
  ln -s ${SLACKPKGDIR}/l/SDL2_image-*.txz
  ln -s ${SLACKPKGDIR}/l/SDL2_mixer-*.txz
  ln -s ${SLACKPKGDIR}/l/SDL2_net-*.txz
  ln -s ${SLACKPKGDIR}/l/SDL2_ttf-*.txz
fi

if [ "${INCSPEEX}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/speex-*.txz
fi

if [ "${INCSPEEXDSP}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/speexdsp-*.txz
fi

if [ "${INCSTARTUPNOTIFICATION}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/startup-notification-*.txz
fi

if [ "${INCVFOURLUTILS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/v4l-utils-*.txz
fi

if [ "${INCVORBISTOOLS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/vorbis-tools-*.txz
fi

if [ "${INCVTE}" == "Y" ]; then
# xfce4-terminal needs vte
  ln -s ${SLACKPKGDIR}/l/vte-*.txz
fi

if [ "${INCWAVPACK}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/wavpack-*.txz
fi
### Libraries #########################

# IS THIS GONE NOW??
if [ "${INCMOZILLAFIREFOX}" == "Y" -a "${INCMPLAYER}" == "Y" ]; then
  linkmodule ${SLACKEXTRA}/mplayerplug-in/mplayerplug-in-*.txz
fi
