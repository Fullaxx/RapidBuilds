#!/bin/bash

FFDIR="/tmp/.ff"

if [ ! -d ${FFDIR} ]; then mkdir -p ${FFDIR}; fi

firefox --new-instance --profile ${FFDIR} 2>${FFDIR}/err.log
