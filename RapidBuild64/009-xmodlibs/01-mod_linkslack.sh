#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f *.txz *.xzm

linkpackage ${SLACKPKGDIR}/l/brotli-*.txz
linkpackage ${SLACKPKGDIR}/l/fuse-*.txz
linkpackage ${SLACKPKGDIR}/l/icu4c-*.txz

linkpackage ${SLACKPKGDIR}/l/libidn2-*.txz
linkpackage ${SLACKPKGDIR}/l/libnl-*.txz
linkpackage ${SLACKPKGDIR}/l/libnl3-*.txz
# wget,libsoup require libpsl
linkpackage ${SLACKPKGDIR}/l/libpsl-*.txz
linkpackage ${SLACKPKGDIR}/l/libsigc++-*.txz
linkpackage ${SLACKPKGDIR}/l/libtasn1-*.txz
linkpackage ${SLACKPKGDIR}/l/libunistring-*.txz
linkpackage ${SLACKPKGDIR}/l/libxml2-*.txz

linkpackage ${SLACKPKGDIR}/l/pcre-*.txz
linkpackage ${SLACKPKGDIR}/l/pcre2-*.txz
linkpackage ${SLACKPKGDIR}/l/sg3_utils-*.txz
linkpackage ${SLACKPKGDIR}/l/shared-mime-info-*.txz
# rsync needs xxHash
linkpackage ${SLACKPKGDIR}/l/xxHash-*.txz

linkpackage ${SLACKPKGDIR}/l/lz4-*.txz
linkpackage ${SLACKPKGDIR}/l/zstd-*.txz

linkpackage ${SLACKPKGDIR}/n/ca-certificates-*.txz
linkpackage ${SLACKPKGDIR}/n/cyrus-sasl-*.txz
linkpackage ${SLACKPKGDIR}/n/gnutls-*.txz
linkpackage ${SLACKPKGDIR}/n/nettle-*.txz
linkpackage ${SLACKPKGDIR}/n/openssl-*.txz
linkpackage ${SLACKPKGDIR}/n/p11-kit-*.txz
linkpackage ${SLACKPKGDIR}/n/nghttp2-*.txz
linkpackage ${SLACKPKGDIR}/n/nghttp3-*.txz

if [ "${INCABSEILCPP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/abseil-cpp-*.txz
fi

if [ "${INCALSA}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/alsa-utils-*.txz
  linkpackage ${SLACKPKGDIR}/l/alsa-lib-*.txz
  linkpackage ${SLACKPKGDIR}/l/alsa-oss-*.txz
fi

if [ "${INCAPR}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/apr-1.*.txz
  linkpackage ${SLACKPKGDIR}/l/apr-util-*.txz
fi

if [ "${INCARGONTWO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/argon2-*.txz
fi

if [ "${INCASPELL}" == "Y" ]; then
# enchant and bluefish need aspell
  linkpackage ${SLACKPKGDIR}/l/aspell-en-*.txz
  linkpackage ${SLACKPKGDIR}/l/aspell-0.*.txz
fi

if [ "${INCBOOST}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/boost-*.txz
fi

if [ "${INCCARES}" == "Y" ]; then
# wireshark needs c-ares
  linkpackage ${SLACKPKGDIR}/n/c-ares-*.txz
fi

if [ "${INCDB48}" == "Y" ]; then
# rpm needs db48
  linkpackage ${SLACKPKGDIR}/l/db48-*.txz
fi

if [ "${INCDBUSGLIB}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/dbus-glib-*.txz
fi

if [ "${INCDUKTAPE}" == "Y" ]; then
# polkit needs duktape
  linkpackage ${SLACKPKGDIR}/l/duktape-*.txz
fi

if [ "${INCELFUTILS}" == "Y" ]; then
# rpm needs elfutils
  linkpackage ${SLACKPKGDIR}/l/elfutils-*.txz
fi

if [ "${INCENCHANT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/enchant-*.txz
fi

if [ "${INCEXPAT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/expat-*.txz
fi

if [ "${INCFFTW}" == "Y" ]; then
# alsa,imagemagick needs fftw
  linkpackage ${SLACKPKGDIR}/l/fftw-*.txz
fi

if [ "${INCFUSETHREE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/fuse3-*.txz
fi

if [ "${INCGC}" == "Y" ]; then
# XXX needs GC
  linkpackage ${SLACKPKGDIR}/l/gc-*.txz
fi

if [ "${INCGDBM}" == "Y" ]; then
# perl,python3.11 needs gdbm
  linkpackage ${SLACKPKGDIR}/l/gdbm-*.txz
fi

if [ "${INCGLIBONE}" == "Y" ]; then
# xmms needs glib
  linkpackage ${SLACKPKGDIR}/l/glib-1.2.10-*.txz
fi

if [ "${INCGPGME}" == "Y" ]; then
# Samba,mcabber
  linkpackage ${SLACKPKGDIR}/n/gpgme-*.txz
fi

if [ "${INCGSL}" == "Y" ]; then
# intel-gpu-tools needs gsl, does anything else need it?
  linkpackage ${SLACKPKGDIR}/l/gsl-*.txz
fi

if [ "${INCHUNSPELL}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/hunspell-*.txz
fi

if [ "${INCHYPHEN}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/hyphen-*.txz
fi

if [ "${INCISL}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/isl-*.txz
fi

if [ "${INCISOCODES}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/iso-codes-*.txz
fi

if [ "${INCJANSSON}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/jansson-*.txz
fi

if [ "${INCJEMALLOC}" == "Y" ]; then
# MariaDB needs jemalloc
  linkpackage ${SLACKPKGDIR}/l/jemalloc-*.txz
fi

if [ "${INCJSONC}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/json-c-*.txz
fi

if [ "${INCJSONGLIB}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/json-glib-*.txz
fi

if [ "${INCJUDY}" == "Y" ]; then
# MariaDB needs Judy
  linkpackage ${SLACKPKGDIR}/l/judy-*.txz
fi

if [ "${INCKEYBINDERTHREE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/keybinder3-*.txz
fi

if [ "${INCLCMSTWO}" == "Y" ]; then
# openjpeg,imagemagick needs lcms2
# moved in from 012-xapps
# emacs-no-x11 needs this?
  linkpackage ${SLACKPKGDIR}/l/lcms2-*.txz
fi

if [ "${INCLENSFUN}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/lensfun-*.txz
fi

if [ "${INCLIBAIO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libaio-*.txz
fi

if [ "${INCLIBARCHIVE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libarchive-*.txz
fi

if [ "${INCLIBASSUAN}" == "Y" ]; then
# Samba,gpgme,gnupg2,pinentry reqs libassuan
  linkpackage ${SLACKPKGDIR}/n/libassuan-*.txz
fi

if [ "${INCLIBDEFLATE}" == "Y" ]; then
# openexr reqs libdeflate
  linkpackage ${SLACKPKGDIR}/l/libdeflate-*.txz
fi

if [ "${INCLIBGCRYPT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/libgcrypt-*.txz
fi

if [ "${INCLIBGLADE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libglade-*.txz
fi

if [ "${INCLIBGNOMEKEYRING}" == "Y" ]; then
# svn needs libgnome-keyring
  linkpackage ${SLACKPKGDIR}/l/libgnome-keyring-*.txz
fi

if [ "${INCLIBGPGERROR}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/n/libgpg-error-*.txz
fi

if [ "${INCLIBIODBC}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libiodbc-*.txz
fi

if [ "${INCLIBMCRYPT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libmcrypt-*.txz
fi

if [ "${INCLIBMPC}" == "Y" ]; then
# GCC needs libmpc
  linkpackage ${SLACKPKGDIR}/l/libmpc-*.txz
fi

if [ "${INCLIBNDP}" == "Y" ]; then
# NetworkManager needs libndp
  linkpackage ${SLACKPKGDIR}/n/libndp-*.txz
fi

if [ "${INCLIBNIH}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libnih-*.txz
fi

if [ "${INCLIBPCAP}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libpcap-*.txz
fi

if [ "${INCLIBPROXY}" == "Y" ]; then
# neon,hexchat need libproxy
  linkpackage ${SLACKPKGDIR}/l/libproxy-*.txz
fi

if [ "${INCLIBSAMPLERATE}" == "Y" ]; then
# alsa needs libsamplerate
  linkpackage ${SLACKPKGDIR}/l/libsamplerate-*.txz
fi

if [ "${INCLIBSECRET}" == "Y" ]; then
# pinentry reqs libsecret
  linkpackage ${SLACKPKGDIR}/l/libsecret-*.txz
fi

if [ "${INCLIBSIGCPLUSPLUSTHREE}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libsigc++3-*.txz
fi

if [ "${INCLIBSODIUM}" == "Y" ]; then
# zeromq needs libsodium
  linkpackage ${SLACKPKGDIR}/l/libsodium-*.txz
fi

if [ "${INCLIBSSHONE}" == "Y" ]; then
# ffmpeg,libvirt needs libssh
  linkpackage ${SLACKPKGDIR}/l/libssh-*.txz
fi

if [ "${INCLIBUNWIND}" == "Y" ]; then
# strace,samba needs libunwind
  linkpackage ${SLACKPKGDIR}/l/libunwind-*.txz
fi

if [ "${INCLIBURING}" == "Y" ]; then
# mariadb,samba needs liburing
  linkpackage ${SLACKPKGDIR}/l/liburing-*.txz
fi

if [ "${INCLIBUSB}" == "Y" ]; then
# usbredir needs libusb
  linkpackage ${SLACKPKGDIR}/l/libusb-*.txz
fi

if [ "${INCLIBUV}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libuv-*.txz
fi

if [ "${INCLIBVPX}" == "Y" ]; then
# /usr/lib64/php/extensions/gd.so, ffmpeg need libvpx
  linkpackage ${SLACKPKGDIR}/l/libvpx-*.txz
fi

if [ "${INCLIBXSLT}" == "Y" ]; then
# needed by PHP and /usr/lib64/java/lib/amd64/libjfxwebkit.so
  linkpackage ${SLACKPKGDIR}/l/libxslt-*.txz
fi

if [ "${INCLIBYAML}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/libyaml-*.txz
fi

if [ "${INCLIBZIP}" == "Y" ]; then
# imagemagick,scim needs libzip
  linkpackage ${SLACKPKGDIR}/l/libzip-*.txz
fi

if [ "${INCLMDB}" == "Y" ]; then
# samba,rpm needs lmdb
  linkpackage ${SLACKPKGDIR}/l/lmdb-*.txz
fi

if [ "${INCLOUDMOUTH}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/loudmouth-*.txz
fi

#if [ "${INCLZLIB}" == "Y" ]; then
#  linkpackage ${SLACKPKGDIR}/a/lzlib-*.txz
#fi

if [ "${INCLZO}" == "Y" ]; then
# squashfs-tools,btrsfs-progs,lrzip needs lzo
  linkpackage ${SLACKPKGDIR}/l/lzo-*.txz
fi

if [ "${INCPOLKIT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/polkit-[0-9][0-9][0-9]-*.txz
fi

if [ "${INCMOZILLANSS}" == "Y" ]; then
# chrome needs this
  linkpackage ${SLACKPKGDIR}/l/mozilla-nss-*.txz
fi

if [ "${INCMOZJS}" == "Y" ]; then
# polkit needs mozjs
  linkpackage ${SLACKPKGDIR}/l/mozjs???-*.txz
fi

if [ "${INCNEON}" == "Y" ]; then
# audacious needs neon
  linkpackage ${SLACKPKGDIR}/l/neon-*.txz
fi

if [ "${INCPINENTRY}" == "Y" ]; then
# cryptsetup,gnupg2 reqs pinentry
  linkpackage ${SLACKPKGDIR}/n/pinentry-*.txz
fi

if [ "${INCPROTOBUF}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/protobuf-*.txz
fi

#if [ "${INCPROTOBUFC}" == "Y" ]; then
#  linkpackage "${PACKAGESDIR}/protobuf/protobuf-c-1.4.1-${ARCH}-bksrc1.xzm"
#fi

if [ "${INCSERF}" == "Y" ]; then
# subversion needs serf
  linkpackage ${SLACKPKGDIR}/l/serf-*.txz
fi

if [ "${INCTALLOC}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/talloc-*.txz
fi

if [ "${INCTEVENT}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/tevent-*.txz
fi

if [ "${INCTONELIB}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/t1lib-*.txz
fi

if [ "${INCUPOWER}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/a/upower-*.txz
  linkpackage ${SLACKPKGDIR}/l/libimobiledevice-*.txz
  linkpackage ${SLACKPKGDIR}/l/libplist-*.txz
fi

if [ "${INCUSBMUXD}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/ap/usbmuxd-*.txz
  linkpackage ${SLACKPKGDIR}/l/libusbmuxd-*.txz
fi

if [ "${INCUTFEIGHTPROC}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/utf8proc-*.txz
fi

if [ "${INCWOFFTWO}" == "Y" ]; then
  linkpackage ${SLACKPKGDIR}/l/woff2-*.txz
fi
