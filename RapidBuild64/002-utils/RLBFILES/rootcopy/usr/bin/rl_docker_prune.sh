#!/bin/bash

if [ `id -u` != "0" ]; then
  echo "Got Root?"
  exit 1
fi

# also an option
# docker system prune -a -f

docker system prune && \
echo && \
docker volume prune
