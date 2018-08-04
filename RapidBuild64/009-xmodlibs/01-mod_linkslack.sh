#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f *.txz *.xzm

linkpackage ${SLACKPKGDIR}/l/fuse-*.txz
linkpackage ${SLACKPKGDIR}/l/icu4c-*.txz

linkpackage ${SLACKPKGDIR}/l/libidn2-*.txz
linkpackage ${SLACKPKGDIR}/l/libnl-*.txz
linkpackage ${SLACKPKGDIR}/l/libnl3-*.txz
linkpackage ${SLACKPKGDIR}/l/libsigc++-*.txz
linkpackage ${SLACKPKGDIR}/l/libtasn1-*.txz
linkpackage ${SLACKPKGDIR}/l/libunistring-*.txz
linkpackage ${SLACKPKGDIR}/l/libxml2-*.txz

linkpackage ${SLACKPKGDIR}/l/pcre-*.txz
linkpackage ${SLACKPKGDIR}/l/pcre2-*.txz
linkpackage ${SLACKPKGDIR}/l/sg3_utils-*.txz
linkpackage ${SLACKPKGDIR}/l/shared-mime-info-*.txz

linkpackage ${SLACKPKGDIR}/n/ca-certificates-*.txz
linkpackage ${SLACKPKGDIR}/n/cyrus-sasl-*.txz
linkpackage ${SLACKPKGDIR}/n/gnutls-*.txz
linkpackage ${SLACKPKGDIR}/n/nettle-*.txz
linkpackage ${SLACKPKGDIR}/n/openssl-*.txz
linkpackage ${SLACKPKGDIR}/n/p11-kit-*.txz
linkpackage ${SLACKPKGDIR}/n/nghttp2-*.txz

if [ "${INCUPOWER}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/upower-*.txz
  linkpackage ${SLACKPKGDIR}/l/libimobiledevice-*.txz
  linkpackage ${SLACKPKGDIR}/l/libplist-*.txz
fi

if [ "${INCUSBMUXD}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/usbmuxd-*.txz
  linkpackage ${SLACKPKGDIR}/l/libusbmuxd-*.txz
fi

if [ "${INCALSA}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/alsa-utils-*.txz
  linkpackage ${SLACKPKGDIR}/l/alsa-lib-*.txz
  linkpackage ${SLACKPKGDIR}/l/alsa-oss-*.txz
fi

if [ "${INCLIBSAMPLERATE}" == "Y" ]; then
# alsa needs libsamplerate
  linkpackage ${SLACKPKGDIR}/l/libsamplerate-*.txz
fi

if [ "${INCFFTW}" == "Y" ]; then
# alsa,imagemagick needs fftw
  linkpackage ${SLACKPKGDIR}/l/fftw-*.txz
fi

if [ "${INCLIBARCHIVE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libarchive-*.txz
fi

if [ "${INCLZLIB}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/lzlib-*.txz
fi

if [ "${INCLIBPCAP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libpcap-*.txz
fi

if [ "${INCLIBGCRYPT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/libgcrypt-*.txz
fi

if [ "${INCLIBGPGERROR}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/libgpg-error-*.txz
fi

if [ "${INCGPGME}" == "Y" ]; then
# Samba,mcabber
  linkpackage ${SLACKPKGDIR}/n/gpgme-*.txz
fi

if [ "${INCPINENTRY}" == "Y" ]; then
# cryptsetup,gnupg2 reqs pinentry
  linkpackage ${SLACKPKGDIR}/n/pinentry-*.txz
fi

if [ "${INCLIBSECRET}" == "Y" ]; then
# pinentry reqs libsecret
  linkpackage ${SLACKPKGDIR}/l/libsecret-*.txz
fi

if [ "${INCLIBASSUAN}" == "Y" ]; then
# Samba,gpgme,gnupg2,pinentry reqs libassuan
  linkpackage ${SLACKPKGDIR}/n/libassuan-*.txz
fi

if [ "${INCLIBGLADE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libglade-*.txz
fi

if [ "${INCLIBTIRPC}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/libtirpc-*.txz
fi

if [ "${INCLIBTALLOC}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/talloc-*.txz
fi

if [ "${INCLIBTEVENT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/tevent-*.txz
fi

if [ "${INCLIBNIH}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libnih-*.txz
fi

if [ "${INCLIBNDP}" == "Y" ]; then
# NetworkManager needs libndp
  linkpackage ${SLACKPKGDIR}/n/libndp-*.txz
fi

if [ "${INCJANSSON}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/jansson-*.txz
fi

if [ "${INCASPELL}" == "Y" ]; then
# enchant and bluefish need aspell
  linkpackage ${SLACKPKGDIR}/l/aspell-en-*.txz
  linkpackage ${SLACKPKGDIR}/l/aspell-?.*.txz
fi

if [ "${INCENCHANT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/enchant-*.txz
fi

if [ "${INCHUNSPELL}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/hunspell-*.txz
fi

if [ "${INCLIBPROXY}" == "Y" ]; then
# neon,hexchat need libproxy
  linkpackage ${SLACKPKGDIR}/l/libproxy-*.txz
fi

if [ "${INCNEON}" == "Y" ]; then
# audactous needs neon
  linkpackage ${SLACKPKGDIR}/l/neon-*.txz
fi

if [ "${INCJSONEEIGHTYFIVE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/js185-*.txz
fi

if [ "${INCSERF}" == "Y" ]; then
# subversion needs serf
  linkpackage ${SLACKPKGDIR}/l/serf-*.txz
fi

if [ "${INCLIBAPR}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/apr-1.*.txz
  linkpackage ${SLACKPKGDIR}/l/apr-util-*.txz
fi

if [ "${INCLOUDMOUTH}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/loudmouth-*.txz
fi

if [ "${INCMOZILLANSS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/mozilla-nss-*.txz
fi

if [ "${INCSEAMONKEYSOLIBS}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/seamonkey-solibs-*.txz
fi

if [ "${INCDBUSGLIB}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/dbus-glib-*.txz
fi

if [ "${INCLIBSODIUM}" == "Y" ]; then
# zeromq needs libsodium
  linkpackage ${SLACKPKGDIR}/l/libsodium-*.txz
fi

if [ "${INCJUDY}" == "Y" ]; then
# MariaDB needs Judy
  linkpackage ${SLACKPKGDIR}/l/judy-*.txz
fi

if [ "${INCJEMALLOC}" == "Y" ]; then
# MariaDB needs jemalloc
  linkpackage ${SLACKPKGDIR}/l/jemalloc-*.txz
fi

if [ "${INCLIBAIO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libaio-*.txz
fi

if [ "${INCLIBIODBC}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libiodbc-*.txz
fi

if [ "${INCLIBMCRYPT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libmcrypt-*.txz
fi

if [ "${INCLIBVPX}" == "Y" ]; then
# /usr/lib64/php/extensions/gd.so, ffmpeg need libvpx
  linkpackage ${SLACKPKGDIR}/l/libvpx-*.txz
fi

if [ "${INCLIBXSLT}" == "Y" ]; then
# needed by PHP and /usr/lib64/java/lib/amd64/libjfxwebkit.so
  linkpackage ${SLACKPKGDIR}/l/libxslt-*.txz
fi

if [ "${INCTONELIB}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/t1lib-*.txz
fi

if [ "${INCLIBCROCO}" == "Y" ]; then
# gettext,librsvg needs libcroco
  linkpackage ${SLACKPKGDIR}/l/libcroco-*.txz
fi

if [ "${INCEXPAT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/expat-*.txz
fi

if [ "${INCGC}" == "Y" ]; then
# XXX needs GC
  linkpackage ${SLACKPKGDIR}/l/gc-*.txz
fi

if [ "${INCLIBMPC}" == "Y" ]; then
# GCC needs libmpc
  linkpackage ${SLACKPKGDIR}/l/libmpc-*.txz
fi

if [ "${INCLIBUNWIND}" == "Y" ]; then
# strace needs libunwind
  linkpackage ${SLACKPKGDIR}/l/libunwind-*.txz
fi

if [ "${INCGNOMEKEYRING}" == "Y" ]; then
# svn needs gnome-keyring
  linkpackage ${SLACKPKGDIR}/l/libgnome-keyring-*.txz
fi

if [ "${INCELFUTILS}" == "Y" ]; then
# rpm needs elfutils
  linkpackage ${SLACKPKGDIR}/l/elfutils-*.txz
fi

if [ "${INCDB48}" == "Y" ]; then
# rpm needs db48
  linkpackage ${SLACKPKGDIR}/l/db48-*.txz
fi

if [ "${INCLIBPOLKIT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/polkit-?.*.txz
fi

if [ "${INCLIBSSHONE}" == "Y" ]; then
# ffmpeg needs libssh
  linkpackage ${SLACKPKGDIR}/l/libssh-*.txz
fi

if [ "${INCGLIBONE}" == "Y" ]; then
# xmms needs glib
  linkpackage ${SLACKPKGDIR}/l/glib-1.2.10-*.txz
fi

if [ "${INCGSL}" == "Y" ]; then
# intel-gpu-tools needs gsl, does anything else need it?
  linkpackage ${SLACKPKGDIR}/l/gsl-*.txz
fi

if [ "${INCCONSOLEKITTWO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/ConsoleKit2-*.txz
fi

if [ "${INCJSONC}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/json-c-*.txz
fi

if [ "${INCJSONGLIB}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/json-glib-*.txz
fi

if [ "${INCLIBZIP}" == "Y" ]; then
# scim needs libzip
  linkpackage ${SLACKPKGDIR}/l/libzip-*.txz
fi
