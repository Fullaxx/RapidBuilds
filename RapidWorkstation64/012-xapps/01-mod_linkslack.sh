#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f *.txz *.xzm

### Desktop Environments ##############
if [ "${INCBLACKBOX}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/xap/blackbox-*.txz
fi

if [ "${INCFLUXBOX}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/xap/fluxbox-*.txz
fi

if [ "${INCXFCE}" == "Y" ]; then
  for XFCEPKG in ${SLACKPKGDIR}/xfce/*.txz; do linkpackage ${XFCEPKG}; done
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
  linkpackage ${SLACKPKGDIR}/xfce/tumbler-*.txz
fi
if [ "${INCXFCEPOWERMANAGER}" == "Y" ]; then
# xfce4-power-manager needs upower
  linkpackage ${SLACKPKGDIR}/xfce/xfce4-power-manager-*.txz
fi
if [ "${INCXFCESCREENSHOOTER}" == "Y" ]; then
# xfce4-screenshooter needs libsoup
  linkpackage ${SLACKPKGDIR}/xfce/xfce4-screenshooter-*.txz
fi
if [ "${INCXFCESETTINGS}" == "Y" ]; then
# xfce4-settings needs upower
  linkpackage ${SLACKPKGDIR}/xfce/xfce4-settings-*.txz
fi
### Desktop Environments ##############

### Apps ##############################
if [ "${INCAUDACIOUS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/xap/audacious-?.*.txz
  linkpackage ${SLACKPKGDIR}/xap/audacious-plugins-*.txz
fi

if [ "${INCGFTP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/xap/gftp-*.txz
fi

if [ "${INCGIMP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/xap/gimp-*.txz
fi

if [ "${INCGKRELLM}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/xap/gkrellm-*.txz
fi

if [ "${INCGNUCHESS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/xap/gnuchess-*.txz
fi

if [ "${INCGNUPLOT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/xap/gnuplot-*.txz
fi

if [ "${INCGPA}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/gpa-*.txz
fi

if [ "${INCGPARTED}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/xap/gparted-*.txz
fi

if [ "${INCHEXCHAT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/xap/hexchat-*.txz
fi

if [ "${INCMOZILLAFIREFOX}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/xap/mozilla-firefox-*.txz
fi

if [ "${INCMOZILLATHUNDERBIRD}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/xap/mozilla-thunderbird-*.txz
fi

if [ "${INCSEAMONKEY}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/xap/seamonkey-*.txz
fi

if [ "${INCMPLAYER}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/xap/MPlayer-*.txz
fi

if [ "${INCRDESKTOP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/xap/rdesktop-*.txz
fi

if [ "${INCRXVTUNICODE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/xap/rxvt-unicode-*.txz
fi

if [ "${INCSOMA}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/soma-*.txz
fi

if [ "${INCVIMGVIM}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/xap/vim-gvim-*.txz
fi

if [ "${INCXINE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/xap/xine-ui-*.txz
  linkpackage ${SLACKPKGDIR}/xap/xine-lib-*.txz
fi

if [ "${INCXLOCK}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/xap/xlockmore-*.txz
fi

if [ "${INCXMMS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/xap/xmms-*.txz
fi

if [ "${INCXPAINT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/xap/xpaint-*.txz
fi

if [ "${INCXPDF}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/xap/xpdf-*.txz
fi

if [ "${INCTIGERVNC}" == "Y" ]; then
  linkpackage ${SLACKEXTRA}/tigervnc/tigervnc-*.txz
fi

if [ "${INCFLTK}" == "Y" ]; then
  linkpackage ${SLACKEXTRA}/fltk/fltk-*.txz
fi

if [ "${INCRECORDMYDESKTOP}" == "Y" ]; then
  linkpackage ${SLACKEXTRA}/recordmydesktop/recordmydesktop-*.txz
fi
### Apps ##############################

### Themes ############################
if [ "${INCADWAITAICONTHEME}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/adwaita-icon-theme-*.txz
fi

if [ "${INCGNOMETHEMESSTANDARD}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/gnome-themes-standard-*.txz
fi

if [ "${INCHICOLORICONTHEME}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/hicolor-icon-theme-*.txz
fi

if [ "${INCGSETTINGSDESLTOPSCHEMAS}" == "Y" ]; then
# Evince,terminator needs gsettings-desktop-schemas
  linkpackage ${SLACKPKGDIR}/l/gsettings-desktop-schemas-*.txz
fi

if [ "${INCTANGOICONTHEME}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/tango-icon-theme-*.txz
fi
### Themes ############################

### Libraries #########################
# XXX FIXME
if [ "${INCMMPACKAGE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/glibmm-*.txz
  linkpackage ${SLACKPKGDIR}/l/gtkmm2-*.txz
  linkpackage ${SLACKPKGDIR}/l/gtkmm3-*.txz
  linkpackage ${SLACKPKGDIR}/l/atkmm-*.txz
  linkpackage ${SLACKPKGDIR}/l/cairomm-*.txz
  linkpackage ${SLACKPKGDIR}/l/pangomm-*.txz
fi
# XXX FIXME

if [ "${INCAFIFTYTWO}" == "Y" ]; then
# MPlayer needs liba52
  linkpackage ${SLACKPKGDIR}/l/a52dec-*.txz
fi

if [ "${INCAALIB}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/aalib-*.txz
fi

if [ "${INCATK}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/atk-*.txz
  linkpackage ${SLACKPKGDIR}/l/at-spi2-atk-*.txz
  linkpackage ${SLACKPKGDIR}/l/at-spi2-core-*.txz
fi

if [ "${INCATKMM}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/atkmm-*.txz
fi

if [ "${INCAUDIOFILE}" == "Y" ]; then
# esounds needs audiofile
  linkpackage ${SLACKPKGDIR}/l/audiofile-*.txz
fi

if [ "${INCBABL}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/babl-*.txz
fi

if [ "${INCCAIRO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/cairo-*.txz
fi

if [ "${INCCAIROMM}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/cairomm-*.txz
fi

if [ "${INCDJVULIBRE}" == "Y" ]; then
# imagemagick needs djvulibre
  linkpackage ${SLACKPKGDIR}/l/djvulibre-*.txz
fi

if [ "${INCESOUND}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/esound-*.txz
fi

if [ "${INCFLAC}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/flac-*.txz
fi

if [ "${INCEXIVTWO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/exiv2-*.txz
fi

if [ "${INCFFMPEG}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/ffmpeg-*.txz
fi

if [ "${INCFLUIDSYNTH}" == "Y" ]; then
# audacious wants fluidsynth
  linkpackage ${SLACKPKGDIR}/l/fluidsynth-*.txz
fi

if [ "${INCFRIBIDI}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/fribidi-*.txz
fi

if [ "${INCGCONF}" == "Y" ]; then
# mplayer,Chrome need GConf
  linkpackage ${SLACKPKGDIR}/l/GConf-*.txz
fi

if [ "${INCGD}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/gd-*.txz
fi

if [ "${INCGDK}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/gdk-pixbuf2-*.txz
fi

if [ "${INCGEGL}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/gegl-*.txz
fi

if [ "${INCGEXIVTWO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/gexiv2-*.txz
fi

if [ "${INCGIFLIB}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/giflib-*.txz
fi

if [ "${INCGLADETHREE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/glade3-*.txz
fi

if [ "${INCGLIBMM}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/glibmm-*.txz
fi

if [ "${INCGOBJECTINTROSPECTION}" == "Y" ]; then
# terminator needs gobject-introspection
  linkpackage ${SLACKPKGDIR}/l/gobject-introspection-*.txz
fi

if [ "${INCGSTREAMER}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/gstreamer-*.txz
  linkpackage ${SLACKPKGDIR}/l/gst-plugins-base-*.txz
  linkpackage ${SLACKPKGDIR}/l/gst-plugins-good-*.txz
  if [ "${INCFFMPEG}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/gst-plugins-libav-*.txz
  fi
fi

if [ "${INCGTKMMTWO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/gtkmm2-*.txz
fi

if [ "${INCGTKMMTHREE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/gtkmm3-*.txz
fi

if [ "${INCGTKONE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/gtk+-1.2.10-*.txz
fi

if [ "${INCGTKTWO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/gtk+2-*.txz
fi

if [ "${INCGTKTHREE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/gtk+3-*.txz
fi

if [ "${INCILMBASE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/ilmbase-*.txz
fi

if [ "${INCIMAGEMAGICK}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/imagemagick-*.txz
fi

if [ "${INCJASPER}" == "Y" ]; then
# GIMP,libraw,imagemagick need jasper
  linkpackage ${SLACKPKGDIR}/l/jasper-*.txz
fi

if [ "${INCLAME}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/lame-*.txz
fi

if [ "${INCLCMS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/lcms-*.txz
fi

if [ "${INCLIBBLURAY}" == "Y" ]; then
# MPlayer needs libbluray
  linkpackage ${SLACKPKGDIR}/l/libbluray-*.txz
fi

if [ "${INCLIBCACA}" == "Y" ]; then
# MPlayer needs libcaca
  linkpackage ${SLACKPKGDIR}/l/libcaca-*.txz
fi

if [ "${INCLIBCANBERRA}" == "Y" ]; then
# hexchat needs libcanberra
  linkpackage ${SLACKPKGDIR}/l/libcanberra-*.txz
fi

if [ "${INCCDDB}" == "Y" ]; then
# Audacious,paranoia need libcddb
  linkpackage ${SLACKPKGDIR}/l/libcddb-*.txz
fi

if [ "${INCCDIO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libcdio-?.?.?-*.txz
# libcdio-paranoia holds libcdio_cdda.so.?.?.?, it also wants libcddb
  linkpackage ${SLACKPKGDIR}/l/libcdio-paranoia-*.txz
fi

if [ "${INCLIBDVDNAV}" == "Y" ]; then
# MPlayer needs libdvdnav
  linkpackage ${SLACKPKGDIR}/l/libdvdnav-*.txz
fi

if [ "${INCLIBDVDREAD}" == "Y" ]; then
# MPlayer needs libdvdread
  linkpackage ${SLACKPKGDIR}/l/libdvdread-*.txz
fi

if [ "${INCLIBEXIF}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libexif-*.txz
fi

if [ "${INCLIBJPEGTURBO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libjpeg-turbo-*.txz
fi

if [ "${INCLIBMAD}" == "Y" ]; then
# mplayer need libmad
  linkpackage ${SLACKPKGDIR}/l/libmad-*.txz
fi

if [ "${INCLIBMNG}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libmng-*.txz
fi

if [ "${INCLIBNOTIFY}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libnotify-*.txz
fi

if [ "${INCLIBOGG}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libogg-*.txz
fi

if [ "${INCLIBPNG}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libpng-*.txz
fi

if [ "${INCLIBPTHREADSTUBS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/libpthread-stubs-*.txz
fi

if [ "${INCLIBRAW}" == "Y" ]; then
# imagemagick needs libraw
  linkpackage ${SLACKPKGDIR}/l/LibRaw-*.txz
fi

if [ "${INCLIBRSVG}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/librsvg-*.txz
fi

if [ "${INCLIBSNDFILE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libsndfile-*.txz
fi

if [ "${INCLIBTHEORA}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libtheora-*.txz
fi

if [ "${INCLIBTIFF}" == "Y" ]; then
# evince needs libtiff
  linkpackage ${SLACKPKGDIR}/l/libtiff-*.txz
fi

if [ "${INCLIBVORBIS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libvorbis-*.txz
fi

if [ "${INCLIBWEBP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libwebp-*.txz
fi

if [ "${INCLIBWNCK}" == "Y" ]; then
# xfce4-panel needs libwnck
  linkpackage ${SLACKPKGDIR}/l/libwnck-*.txz
fi

if [ "${INCLIBWMF}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libwmf-*.txz
fi

if [ "${INCOPENCL}" == "Y" ]; then
# imagemagick needs OpenCL
  linkpackage ${SLACKPKGDIR}/l/ocl-icd-*.txz
fi

if [ "${INCOPENEXR}" == "Y" ]; then
# GIMP,GEGL,imagemagick need openexr
  linkpackage ${SLACKPKGDIR}/l/openexr-*.txz
fi

if [ "${INCOPUS}" == "Y" ]; then
# GIMP,GEGL,imagemagick need openexr
  linkpackage ${SLACKPKGDIR}/l/opus-*.txz
fi

if [ "${INCOPENJPEG}" == "Y" ]; then
# Evince, ffmpeg, vlc
  linkpackage ${SLACKPKGDIR}/l/openjpeg-*.txz
fi

if [ "${INCORC}" == "Y" ]; then
# gstreamer needs orc
  linkpackage ${SLACKPKGDIR}/l/orc-*.txz
fi

if [ "${INCPANGO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/pango-*.txz
fi

if [ "${INCPANGOMM}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/pangomm-*.txz
fi

if [ "${INCPAVUCONTROL}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/xap/pavucontrol-*.txz
fi

if [ "${INCPOPPLER}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/poppler-?.*.txz
  linkpackage ${SLACKPKGDIR}/l/poppler-data-*.txz
fi

if [ "${INCPULSE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/pulseaudio-*.txz
  linkpackage ${SLACKPKGDIR}/l/libasyncns-*.txz
  linkpackage ${SLACKPKGDIR}/l/sbc-*.txz
fi

if [ "${INCQT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/qt-*.txz
  linkpackage ${SLACKPKGDIR}/l/polkit-qt-?-*.txz
fi

if [ "${INCSDL}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/sdl-*.txz
fi

# Sun Mar 19 05:27:13 UTC 2017 (ffmpeg now includes ffplay, which required the SDL2 libraries.)
if [ "${INCSDLTWO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/SDL2-*.txz
  linkpackage ${SLACKPKGDIR}/l/SDL2_gfx-*.txz
  linkpackage ${SLACKPKGDIR}/l/SDL2_image-*.txz
  linkpackage ${SLACKPKGDIR}/l/SDL2_mixer-*.txz
  linkpackage ${SLACKPKGDIR}/l/SDL2_net-*.txz
  linkpackage ${SLACKPKGDIR}/l/SDL2_ttf-*.txz
fi

if [ "${INCSPEEX}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/speex-*.txz
fi

if [ "${INCSPEEXDSP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/speexdsp-*.txz
fi

if [ "${INCSTARTUPNOTIFICATION}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/startup-notification-*.txz
fi

if [ "${INCVFOURLUTILS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/v4l-utils-*.txz
fi

if [ "${INCVORBISTOOLS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/vorbis-tools-*.txz
fi

if [ "${INCVTE}" == "Y" ]; then
# xfce4-terminal needs vte
  linkpackage ${SLACKPKGDIR}/l/vte-*.txz
fi

if [ "${INCWAVPACK}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/wavpack-*.txz
fi

if [ "${INCLIBMYPAINT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/x/libmypaint-*.txz
  linkpackage ${SLACKPKGDIR}/x/mypaint-brushes-*.txz
fi
### Libraries #########################

# IS THIS GONE NOW??
#if [ "${INCMOZILLAFIREFOX}" == "Y" -a "${INCMPLAYER}" == "Y" ]; then
#  linkpackage ${SLACKEXTRA}/mplayerplug-in/mplayerplug-in-*.txz
#fi
