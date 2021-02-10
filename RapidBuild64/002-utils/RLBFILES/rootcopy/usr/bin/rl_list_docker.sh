#!/bin/bash

if [ `id -u` != "0" ]; then
  echo "Got Root?"
  exit 1
fi

docker ps -a
echo
docker system df
echo
docker images
echo
docker volume ls
echo
docker network ls
