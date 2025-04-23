#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Clean up QT5
if [ "${INCQTFIVE}" == "Y" ]; then
# libgstcamerabin needs gst-plugins-bad-free
# rm ${DIR}/usr/${LIBDIR}/qt5/plugins/mediaservice/libgstcamerabin.so
# During a wireshark build, it was discovered that this file needs to exist
# Evidently the QT make system will barf if it can't find all its limbs
# despite the fact that it's completely unnecessary
# touch ${DIR}/usr/${LIBDIR}/qt5/plugins/mediaservice/libgstcamerabin.so

  if [ "${INCMARIADB}" != "Y" ]; then
    rm ${DIR}/usr/${LIBDIR}/qt5/plugins/sqldrivers/libqsqlmysql.so
  fi

  rm ${DIR}/usr/${LIBDIR}/qt5/plugins/texttospeech/libqtexttospeech_speechd.so
  rmdir ${DIR}/usr/${LIBDIR}/qt5/plugins/texttospeech
fi

# Clean up QT6
if [ "${INCQTSIX}" == "Y" ]; then
#  libgstreamermediaplugin.so needs libgstphotography from gst-plugins-bad-free
#  wireshark needs libgstreamermediaplugin.so
#  rm ${DIR}/usr/${LIBDIR}/qt6/plugins/multimedia/libgstreamermediaplugin.so

  if [ "${INCMARIADB}" != "Y" ]; then
    rm ${DIR}/usr/${LIBDIR}/qt6/plugins/sqldrivers/libqsqlmysql.so
  fi

  if [ "${INCPCSCLITE}" != "Y" ]; then
    rm ${DIR}/usr/lib64/libQt6Nfc.so.*
  fi

  rm ${DIR}/usr/${LIBDIR}/qt6/plugins/sqldrivers/libqsqlodbc.so

  rm ${DIR}/usr/${LIBDIR}/qt6/plugins/texttospeech/*.so
  rmdir ${DIR}/usr/${LIBDIR}/qt6/plugins/texttospeech
fi
