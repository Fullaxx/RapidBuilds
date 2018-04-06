#!/bin/bash

if [ ! -d "$1" ]; then
	echo "$0: <dir>"
	exit 1
fi

find "$1" -type d -exec chmod 0755 {} \;
find "$1" -type f -exec chmod 0644 {} \;
