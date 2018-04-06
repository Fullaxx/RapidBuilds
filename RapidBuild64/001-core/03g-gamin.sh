#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Taken from 01-mod_linkslack.sh
# Needed only for libfam by /usr/lib64/gio/modules/libgiofam.so
# ln -s ${SLACKPKGDIR}/l/gamin-*.txz

# Instead of pulling in the entire gamin package, we do this
tar xf ${SLACKPKGDIR}/l/gamin-*.txz -C ${DIR} usr/lib64/libfam.so.0.0.0 || bail "Error extracting usr/lib64/libfam.so.0.0.0 from l/gamin-*.txz"

# What about these:

# usr/lib64/libgamin-1.la
# usr/lib64/libfam.la
# usr/lib64/libgamin-1.so.0.1.10

# usr/lib64/libgamin_shared.a
# usr/include/fam.h
# etc/gamin/gaminrc.new
# usr/libexec/gam_server
