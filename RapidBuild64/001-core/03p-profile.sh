#!/bin/bash

source ../spec.sh
source ./module_spec.sh

sed -e 's#\\u@\\h:\\w#[\\u@\\h (\\w)]#' -i ${DIR}/etc/profile
sed -e 's/export LESS="-M"/export LESS="-M -r"/' -i ${DIR}/etc/profile
sed -e 's#MANPATH=/usr/local/man:/usr/man#MANPATH=/usr/man#' -i ${DIR}/etc/profile
sed -e 's#/usr/local/bin:/usr/bin:/bin:/usr/games#/usr/bin:/bin#' -i ${DIR}/etc/profile
sed -e 's#PATH=/usr/local/sbin:/usr/sbin:/sbin#PATH=/usr/sbin:/sbin#' -i ${DIR}/etc/profile

sed -e 's/export LANG=en_US.UTF-8/#export LANG=en_US.UTF-8/g' -i ${DIR}/etc/profile.d/lang.sh
sed -e 's/#export LANG=C/export LANG=C/g' -i ${DIR}/etc/profile.d/lang.sh
