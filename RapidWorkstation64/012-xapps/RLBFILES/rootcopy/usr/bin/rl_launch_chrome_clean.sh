#!/bin/bash

GCDIR="/tmp/.gc"

if [ ! -d ${GCDIR} ]; then mkdir -p ${GCDIR}; fi

google-chrome --user-data-dir=${GCDIR} 2>${GCDIR}/err.log
