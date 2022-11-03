#!/bin/bash

cat /proc/net/dev | grep -Ev "Inter|face" | cut -d: -f1 | grep -v vboxnet | xargs -n1 ethtool | grep -E "Settings|Speed|Link d"

# ifconfig -s | grep -v Iface | cut -f1 '-d '

