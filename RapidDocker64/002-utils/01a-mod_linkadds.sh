#!/bin/bash

source ../spec.sh
source ./module_spec.sh

linkpackage ${SLACKPKGDIR}/d/git-*.txz

# Docker is currently provided in the shell
# linkpackage "${PACKAGESDIR}/docker/docker-18.06.0-ce-x86_64-1.xzm"
