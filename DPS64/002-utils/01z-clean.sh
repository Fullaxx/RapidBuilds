#!/bin/bash

source ../spec.sh
source ./module_spec.sh

rm -f cdrtools-*.txz

# DPS64/009-xmodlibs/ca-certificates-*.txz needs dcron
# do we need certs?
# rm -f dcron-*.txz

rm -f wget-*.txz
