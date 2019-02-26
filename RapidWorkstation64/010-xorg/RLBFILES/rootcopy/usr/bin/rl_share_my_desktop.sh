#!/bin/bash

if [ ! -x /usr/bin/vncpasswd ]; then
  echo "vncpasswd not found..."
  exit -1
fi

if [ ! -x /usr/bin/x0vncserver ]; then
  echo "x0vncserver not found..."
  exit -1
fi

if [ ! -r ~/.vnc/passwd ]; then
  xterm -e vncpasswd
fi

if [ "$#" -gt "0" ]; then
  PC="-PollingCycle=$1"
  echo "$PC"
else
  PC=""
  echo "$PC"
fi

if [ -r ~/.vnc/passwd ]; then
  xterm -e x0vncserver -PasswordFile="${HOME}/.vnc/passwd" "$PC" -ZlibLevel=9
fi
