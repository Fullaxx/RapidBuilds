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

if [ -z "${RAPIDBUILDSDIR}" ]; then
  export RAPIDBUILDSDIR=$(dirname `pwd`)
fi

if [ -r spec.sh ]; then
  source spec.sh
else
  echo "spec.sh not found!"
  exit 1
fi

if [ "$1" == "bo" ]; then
  cd baseoutput
  ./00-all.sh
  exit 0
fi

if [ "$1" == "all" ]; then
  ./rebuild.sh ${PROJECTCATEGORIES}
  ./rebuild.sh bo
  exit 0
fi

while [ -n "$1" ]; do
  if [ ! -d $1-* ]; then bail "$1 is not a project category under ${PROJNAME}!"; fi
  pushd $1-*
  ./00-all.sh
  popd
  shift
done
