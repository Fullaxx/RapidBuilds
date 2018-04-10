#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f *.txz *.xzm

ln -s ${SLACKPKGDIR}/l/fuse-*.txz
ln -s ${SLACKPKGDIR}/l/icu4c-*.txz

ln -s ${SLACKPKGDIR}/l/libidn2-*.txz
ln -s ${SLACKPKGDIR}/l/libnl-*.txz
ln -s ${SLACKPKGDIR}/l/libnl3-*.txz
ln -s ${SLACKPKGDIR}/l/libsigc++-*.txz
ln -s ${SLACKPKGDIR}/l/libtasn1-*.txz
ln -s ${SLACKPKGDIR}/l/libunistring-*.txz
ln -s ${SLACKPKGDIR}/l/libxml2-*.txz

ln -s ${SLACKPKGDIR}/l/pcre-*.txz
ln -s ${SLACKPKGDIR}/l/pcre2-*.txz
ln -s ${SLACKPKGDIR}/l/sg3_utils-*.txz
ln -s ${SLACKPKGDIR}/l/shared-mime-info-*.txz

ln -s ${SLACKPKGDIR}/n/ca-certificates-*.txz
ln -s ${SLACKPKGDIR}/n/cyrus-sasl-*.txz
ln -s ${SLACKPKGDIR}/n/gnutls-*.txz
ln -s ${SLACKPKGDIR}/n/nettle-*.txz
ln -s ${SLACKPKGDIR}/n/openssl-*.txz
ln -s ${SLACKPKGDIR}/n/p11-kit-*.txz
# ln -s ${SLACKPKGDIR}/n/nghttp2-*.txz
# Sat Mar 24 19:47:01 UTC 2018

if [ "${INCUPOWER}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/upower-*.txz
  ln -s ${SLACKPKGDIR}/l/libimobiledevice-*.txz
  ln -s ${SLACKPKGDIR}/l/libplist-*.txz
fi

if [ "${INCUSBMUXD}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/usbmuxd-*.txz
  ln -s ${SLACKPKGDIR}/l/libusbmuxd-*.txz
fi

if [ "${INCALSA}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/ap/alsa-utils-*.txz
  ln -s ${SLACKPKGDIR}/l/alsa-lib-*.txz
  ln -s ${SLACKPKGDIR}/l/alsa-oss-*.txz
fi

if [ "${INCLIBSAMPLERATE}" == "Y" ]; then
# alsa needs libsamplerate
  ln -s ${SLACKPKGDIR}/l/libsamplerate-*.txz
fi

if [ "${INCFFTW}" == "Y" ]; then
# alsa,imagemagick needs fftw
  ln -s ${SLACKPKGDIR}/l/fftw-*.txz
fi

if [ "${INCLIBARCHIVE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/libarchive-*.txz
fi

if [ "${INCLZLIB}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/a/lzlib-*.txz
fi

if [ "${INCLIBPCAP}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/libpcap-*.txz
fi

if [ "${INCLIBGCRYPT}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/libgcrypt-*.txz
fi

if [ "${INCLIBGPGERROR}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/n/libgpg-error-*.txz
fi

if [ "${INCGPGME}" == "Y" ]; then
# Samba,mcabber
  ln -s ${SLACKPKGDIR}/n/gpgme-*.txz
fi

if [ "${INCPINENTRY}" == "Y" ]; then
# cryptsetup,gnupg2 reqs pinentry
  ln -s ${SLACKPKGDIR}/n/pinentry-*.txz
fi

if [ "${INCLIBSECRET}" == "Y" ]; then
# pinentry reqs libsecret
  ln -s ${SLACKPKGDIR}/l/libsecret-*.txz
fi

if [ "${INCLIBASSUAN}" == "Y" ]; then
# Samba,gpgme,gnupg2,pinentry reqs libassuan
  ln -s ${SLACKPKGDIR}/n/libassuan-*.txz
fi

# Bind9, Samba, mplayer need talloc/tevent VERIFY THIS

if [ "${INCLIBTALLOC}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/talloc-*.txz
fi

if [ "${INCLIBTEVENT}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/tevent-*.txz
fi

if [ "${INCLIBNIH}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/libnih-*.txz
fi

if [ "${INCLIBNDP}" == "Y" ]; then
# NetworkManager needs libndp
  ln -s ${SLACKPKGDIR}/n/libndp-*.txz
fi

# Sat Mar 24 19:47:01 UTC 2018
#if [ "${INCJANSSON}" == "Y" ]; then
#  ln -s ${SLACKPKGDIR}/l/jansson-*.txz
#fi

if [ "${INCASPELL}" == "Y" ]; then
# enchant and bluefish need aspell
  ln -s ${SLACKPKGDIR}/l/aspell-en-*.txz
  ln -s ${SLACKPKGDIR}/l/aspell-?.*.txz || exit 1
fi

if [ "${INCENCHANT}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/enchant-*.txz
fi

if [ "${INCHUNSPELL}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/hunspell-*.txz
fi

if [ "${INCLIBPROXY}" == "Y" ]; then
# neon,hexchat need libproxy
  ln -s ${SLACKPKGDIR}/l/libproxy-*.txz
fi

if [ "${INCJSONEEIGHTYFIVE}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/js185-*.txz
fi

if [ "${INCSERF}" == "Y" ]; then
# subversion needs serf
  ln -s ${SLACKPKGDIR}/l/serf-*.txz
fi

if [ "${INCLIBAPR}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/apr-1.*.txz || exit 1
  ln -s ${SLACKPKGDIR}/l/apr-util-*.txz
fi

if [ "${INCLOUDMOUTH}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/loudmouth-*.txz
fi

if [ "${INCMOZILLANSS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/mozilla-nss-*.txz
fi

if [ "${INCSEAMONKEYSOLIBS}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/seamonkey-solibs-*.txz
fi

if [ "${INCDBUSGLIB}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/dbus-glib-*.txz
fi

if [ "${INCLIBSODIUM}" == "Y" ]; then
# zeromq needs libsodium
  ln -s ${SLACKPKGDIR}/l/libsodium-*.txz
fi

if [ "${INCJUDY}" == "Y" ]; then
# MariaDB needs Judy
  ln -s ${SLACKPKGDIR}/l/judy-*.txz
fi

if [ "${INCJEMALLOC}" == "Y" ]; then
# MariaDB needs jemalloc
  ln -s ${SLACKPKGDIR}/l/jemalloc-*.txz
fi

if [ "${INCLIBAIO}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/libaio-*.txz
fi

if [ "${INCLIBIODBC}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/libiodbc-*.txz
fi

if [ "${INCLIBMCRYPT}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/libmcrypt-*.txz
fi

if [ "${INCLIBVPX}" == "Y" ]; then
# /usr/lib64/php/extensions/gd.so needs libvpx
  ln -s ${SLACKPKGDIR}/l/libvpx-*.txz
fi

if [ "${INCLIBXSLT}" == "Y" ]; then
# needed by PHP and /usr/lib64/java/lib/amd64/libjfxwebkit.so
  ln -s ${SLACKPKGDIR}/l/libxslt-*.txz
fi

if [ "${INCTONELIB}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/t1lib-*.txz
fi

if [ "${INCEXPAT}" == "Y" ]; then
# XXX needs expat
  ln -s ${SLACKPKGDIR}/l/expat-*.txz
fi

if [ "${INCGC}" == "Y" ]; then
# XXX needs GC
  ln -s ${SLACKPKGDIR}/l/gc-*.txz
fi

if [ "${INCLIBMPC}" == "Y" ]; then
# GCC needs libmpc
  ln -s ${SLACKPKGDIR}/l/libmpc-*.txz
fi

if [ "${INCLIBUNWIND}" == "Y" ]; then
# strace needs libunwind
  ln -s ${SLACKPKGDIR}/l/libunwind-*.txz
fi

if [ "${INCGNOMEKEYRING}" == "Y" ]; then
# svn needs gnome-keyring
  ln -s ${SLACKPKGDIR}/l/libgnome-keyring-*.txz
fi

if [ "${INCELFUTILS}" == "Y" ]; then
# rpm needs elfutils
  ln -s ${SLACKPKGDIR}/l/elfutils-*.txz
fi

if [ "${INCDB48}" == "Y" ]; then
# rpm needs db48
  ln -s ${SLACKPKGDIR}/l/db48-*.txz
fi

if [ "${INCLIBPOLKIT}" == "Y" ]; then
  ln -s ${SLACKPKGDIR}/l/polkit-?.*.txz
fi
