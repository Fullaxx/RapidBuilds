#!/bin/bash

source ../spec.sh
source ./module_spec.sh

tar xf ${SLACKPKGDIR}/a/kernel-firmware-*-noarch-?.txz -C ${DIR}/ lib/firmware/i915
