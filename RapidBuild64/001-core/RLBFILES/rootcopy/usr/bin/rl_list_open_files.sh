#!/bin/bash

echo "  COUNT  PID  PROCESS"
lsof 2>/dev/null | awk '{print $2, $1}' | sort -n | uniq -c | sort -rn | head -n 15
