#!/bin/bash

echo "***** Filter Table:"
iptables -nvL

echo; echo
echo "***** Nat Table:"
iptables -nvL -t nat

echo; echo
echo "***** Mangle Table:"
iptables -nvL -t mangle
