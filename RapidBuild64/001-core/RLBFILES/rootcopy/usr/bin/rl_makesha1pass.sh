#!/bin/bash

if [ -z "$1" ]; then
	echo "$0: <password>"
	exit 1
fi

echo -n "$1" | sha1sum | awk '{print $1}'
