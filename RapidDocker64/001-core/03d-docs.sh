#!/bin/bash

source ../spec.sh
source ./module_spec.sh

mkdir -p ${DIR}/usr/share/rapidlinux/docker
cat << EOFF > ${DIR}/usr/share/rapidlinux/docker/examples.txt
# Pull fullaxx/rapidworkstation64 from docker hub
docker pull fullaxx/rapidworkstation64

# Run startx from local image fullaxx/rapidworkstation64 in a new container
docker run -it --privileged --network=host fullaxx/rapidworkstation64 /usr/bin/rl_docker_startx.sh

# Pull an image from a local artifactory instance and spawn an X session
docker pull artifactory.service:5000/IMAGE
docker run -it --privileged --network=host pull artifactory.service:5000/IMAGE /usr/bin/rl_docker_startx.sh

EOFF
chmod 0644 ${DIR}/usr/share/rapidlinux/docker/examples.txt
