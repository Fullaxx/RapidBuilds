#!/bin/bash

BROWSERDIR="${HOME}/.config/vivaldi"
if [ ! -d ${BROWSERDIR} ]; then mkdir -p ${BROWSERDIR}; fi

unset NOSANDBOX
if [ `id -u` == "0" ]; then NOSANDBOX="--no-sandbox"; fi

vivaldi-stable ${NOSANDBOX} --user-data-dir=${BROWSERDIR} 2>${BROWSERDIR}/err.log
