#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Don't need these for a Docker base image
rm -f ${DIR}/usr/$LIBDIR/libidn.so.*
rm -f ${DIR}/usr/$LIBDIR/{libcups,libcupsimage}.*
rm -f ${DIR}/usr/$LIBDIR/{libjpeg,libturbojpeg,libpng14,libpng16,libtiff,libtiffxx}.*

rm -rf ${DIR}/opt/refind
