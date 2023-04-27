#!/bin/bash

lsof 2>/dev/null | awk '{print $2, $1}' | sort | uniq -c | sort -r -n
