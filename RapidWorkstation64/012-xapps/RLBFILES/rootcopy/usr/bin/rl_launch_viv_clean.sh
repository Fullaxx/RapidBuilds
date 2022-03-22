#!/bin/bash

BROWSERDIR="/tmp/.viv"
if [ ! -d ${BROWSERDIR} ]; then mkdir -p ${BROWSERDIR}; fi

unset NOSANDBOX
if [ `id -u` == "0" ]; then NOSANDBOX="--no-sandbox"; fi

vivaldi-stable ${NOSANDBOX} --user-data-dir=${BROWSERDIR} 2>${BROWSERDIR}/err.log

if grep 'Proprietary media' ${BROWSERDIR}/err.log; then
  while [ ! -f ~/.local/lib/vivaldi/media-codecs-*/libffmpeg.so ]; do
    echo -n "."
    sleep 0.1
  done
  echo -n "."
  sleep 1
  echo -n "."
  sleep 1
  echo -n "."
  sleep 1
  rm ${BROWSERDIR}/err.log
  $0
fi
