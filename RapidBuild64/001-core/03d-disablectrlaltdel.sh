#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# chmod +x <this script> to disable the 3-Finger Salute
sed -e 's/ca::ctrlaltdel/# ca::ctrlaltdel/' -i ${DIR}/etc/inittab
