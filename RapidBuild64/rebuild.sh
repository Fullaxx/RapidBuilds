#!/bin/bash

set -e

if [ "$#" == "0" ]; then
  echo "I need a list of numbers..."
  echo "e.g. $0 1 2 3"
  echo "e.g. $0 all"
  exit 1
fi

if [ "$0" != "./rebuild.sh" ]; then
  cd `dirname $0`
fi

if [ -r spec.sh ]; then
  source spec.sh
else
  echo "spec.sh not found!"
  exit 1
fi

if [ "$1" == "all" ]; then
  ./rebuild.sh ${PROJECTCATEGORIES}
  cd baseoutput
  ./00-all.sh
  exit 0
fi

while [ -n "$1" ]; do
  cd 00$1-* 2>/dev/null || cd 0$1-*
#  if [ "$?" != "0" ]; then exit 1; fi

  ./00-all.sh
  cd ../
  shift
done
