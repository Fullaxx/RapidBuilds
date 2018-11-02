#!/bin/bash

udevd --daemon

udevadm trigger

startx
