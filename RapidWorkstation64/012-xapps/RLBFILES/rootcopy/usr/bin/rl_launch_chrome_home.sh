#!/bin/bash

GCDIR="${HOME}/.config/google-chrome"
if [ ! -d ${GCDIR} ]; then mkdir -p ${GCDIR}; fi

unset GCNOSANDBOX
if [ `id -u` == "0" ]; then GCNOSANDBOX="--no-sandbox"; fi

google-chrome ${GCNOSANDBOX} --user-data-dir=${GCDIR} 2>$GCDIR/err.log
