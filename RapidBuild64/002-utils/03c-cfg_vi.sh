#!/bin/bash

source ../spec.sh
source ./module_spec.sh


if [ "${INCNVI}" == "Y" ]; then
  ln -s nvi ${DIR}/usr/bin/vi
elif [ "${INCVIM}" == "Y" ]; then
  ln -s vim ${DIR}/usr/bin/vi
fi
