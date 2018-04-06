#!/bin/bash

if [ -r base -a -r modules -a -r optional -a -r rootcopy ]; then
  clear; ls -la base modules optional; tree -a rootcopy
else
  echo "Cant find necessary directories..."
fi
