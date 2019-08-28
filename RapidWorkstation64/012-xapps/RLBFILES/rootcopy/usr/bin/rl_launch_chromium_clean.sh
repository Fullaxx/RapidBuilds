#!/bin/bash

GCDIR="/tmp/.chr"

if [ ! -d ${GCDIR} ]; then mkdir -p ${GCDIR}; fi

chromium --user-data-dir=${GCDIR} 2>${GCDIR}/err.log
