#!/bin/bash

# cpufreq-info | grep CPU | grep -v 'CPUs which'
cpufreq-info | egrep 'CPU|speed' | grep -v 'CPUs which'
