#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# BareMetal will have cdrecord rm -f cdrtools-*.txz
# If we put python on BareMetal, then we will keep sqlite also
rm -f sqlite-*.txz
