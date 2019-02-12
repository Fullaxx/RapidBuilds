#!/bin/bash

source ../spec.sh
source ./module_spec.sh

sed -e 's/ca::ctrlaltdel/# ca::ctrlaltdel/' -i ${DIR}/etc/inittab
