# RapidBuilds
The Build System for RapidLinux

## Overview
This repository will build 10 different LiveCD projects based on slackware packages. \
The goal is to show how to create different LiveCDs with a very specific set of features. \
The 10 projects are as follows:
```
RapidInstall64
DPS64
VPS64
RapidDocker64
RapidFileserver64
RapidBuild64
IntelLaptop64
RapidWorkstation64
IntelWorkstation64
CudaWorkstation64
```

## Configuration
Each project contains config files that detail exactly what software will exist on the ISO. \
This repository also includes dependency tracking (RDL) so that all requires libraries are included when built.

## Building
There is 1 main script (build_all.sh) that will kick off the build process for each project, creating 1 ISO per project.
