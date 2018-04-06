#!/bin/bash

# ./01-*.sh && ./02-*.sh && ./03-*.sh

for SCR in 0[123456789]*-*.sh; do
  if [ -x $SCR ]; then
    ./$SCR || exit 1
  fi
done
