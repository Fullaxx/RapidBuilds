#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# Remove old athena widgets
rm ${DIR}/usr/${LIBDIR}/{libXaw.so.6,libXaw6.*}
