#!/bin/bash

if [ -d base ] && [ -d modules ] && [ -d optional ] && [ -d rootcopy ]; then
  clear
  ls -la base modules optional
  tree -a rootcopy
  exit 0
fi

echo "Could not find base/modules/optional/rootcopy directories ..."
