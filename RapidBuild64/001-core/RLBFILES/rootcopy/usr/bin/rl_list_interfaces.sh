#!/bin/bash

ifconfig -a | grep -E 'flags|ether|inet|scope'
