#!/bin/bash

cpufreq-info | grep CPU | grep -v 'CPUs which'
