#!/bin/bash

for NETDEV in `cat '/proc/net/dev' | grep -Ev 'Inter| face ' | cut -d: -f1`; do
  case ${NETDEV} in
         lo) ;;
    docker0) ;;
          *) DRIVER=`ethtool -i ${NETDEV} | grep driver: | cut -d: -f2`; echo "${NETDEV}: ${DRIVER}";;
  esac
done
