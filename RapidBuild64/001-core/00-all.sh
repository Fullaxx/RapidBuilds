#!/bin/bash

set -e

for SCR in 0[123456789]*-*.sh; do
  if [ -x $SCR ]; then
    ./$SCR
  fi
done
