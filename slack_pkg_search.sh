#!/bin/bash

if [ -z "$1" ]; then
  echo "$0: <file to search file>"
  exit 1
fi

SLACKDIR="/opt/RL/packages/slackware/Slack64-current"
for TAR in ${SLACKDIR}/slackware64/*/*.txz; do
  if tar tvf $TAR | grep "$1"; then
    echo "found in: $TAR"
    exit 0
  fi
done
