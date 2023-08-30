#!/bin/bash

if [ `id -u` != "0" ]; then
  echo "Got Root?"
  exit 1
fi

docker ps -a
echo
docker images
echo
docker volume ls
echo
#du -sh /var/lib/docker/volumes/*/_data
du -sh /var/lib/docker/volumes/*/_data 2>/dev/null || echo "No volumes to measure"
echo
docker network ls
echo
docker system df
