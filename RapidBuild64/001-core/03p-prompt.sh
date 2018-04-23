#!/bin/bash

source ../spec.sh
source ./module_spec.sh

sed -e 's#\\u@\\h:\\w#[\\u@\\h (\\w)]#' -i ${DIR}/etc/profile
