#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ -f ${DIR}/etc/nanorc ]; then
  sed -e 's/^# set constantshow/set constantshow/' -i ${DIR}/etc/nanorc
  sed -e 's/^# set finalnewline/set finalnewline/' -i ${DIR}/etc/nanorc
#  sed -e 's/^# set linenumbers/set linenumbers/' -i ${DIR}/etc/nanorc
  sed -e 's/^# set smooth/set smooth/' -i ${DIR}/etc/nanorc
  sed -e 's/^# set tabsize 8/set tabsize 4/' -i ${DIR}/etc/nanorc
fi
