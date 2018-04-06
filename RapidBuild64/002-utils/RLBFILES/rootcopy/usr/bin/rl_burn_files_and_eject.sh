#!/bin/bash

if [ "$#" == "0" ]; then
  echo "usage: $0 <files to add ...>"
  exit -1;
fi

TEMPISO="/tmp/DELETEME.iso"

rl_mkiso.sh $TEMPISO $*
if [ "$?" == "0" ]; then
  echo "ISO created successfully..."
  echo
else
  echo "Creation of ISO failed..."
  exit -1
fi
sleep 1
rl_burn_disc_and_eject.sh $TEMPISO

rm -f $TEMPISO
