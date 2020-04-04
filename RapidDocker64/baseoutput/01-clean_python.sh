#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# RapidDocker doesn't have python installed
# do this here before 01-load_segments.shs
rm -f ../0[01]*/0[01]?a-python.xzm
