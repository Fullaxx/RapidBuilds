#!/bin/bash

BROWSERDIR="/tmp/.ff"
if [ ! -d ${BROWSERDIR} ]; then mkdir -p ${BROWSERDIR}; fi

firefox --new-instance --profile ${BROWSERDIR} 2>${BROWSERDIR}/err.log
