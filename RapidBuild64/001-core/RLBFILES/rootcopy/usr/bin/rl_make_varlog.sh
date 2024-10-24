#!/bin/bash

if [ -z "$1" ]; then
  >&2 echo "$0: <PART>"
  exit 1
fi

PART="$1"
if [ ! -b "${PART}" ]; then
  >&2 echo "${PART} is not a block device!"
  exit 2
fi

mkfs.ext4 -O 64bit -L varlog ${PART}
