#!/bin/bash

VIVDIR="/tmp/.viv"

if [ ! -d ${VIVDIR} ]; then mkdir -p ${VIVDIR}; fi

vivaldi-stable --user-data-dir=${VIVDIR} 2>${VIVDIR}/err.log
