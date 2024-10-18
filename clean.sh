#!/bin/bash

if [ `id -u` != "0" ]; then
  echo "Got Root?"
  exit 1
fi

# find . \( -type f -o -type l \) \( -name '*.txz' -o -name '*.xzm' \) -exec rm {} \;

find . -type l -name '*.txz' -exec rm {} \;
find . -type l -name '*.xzm' -exec rm {} \;

find . -type f -name '*.txz' -exec rm {} \;
find . -type f -name '*.xzm' -exec rm {} \;

find . -type f -name '*~' -exec rm {} \;

find . -type f -name 'manifesto.tar' -exec rm {} \;
find . -type f -name '*.mod_pkg_list.txt' -exec rm {} \;
find . -type f -name '*.proj_pkg_list.txt' -exec rm {} \;
