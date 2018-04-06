#!/bin/bash

netstat -nat | grep -v 'Active Internet connections' | awk '{print $6}' | sort | uniq -c | sort -n
