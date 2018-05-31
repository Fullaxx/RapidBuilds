#!/bin/bash

source ../spec.sh
source ./module_spec.sh

cat > ${DIR}/etc/sudoers.d/rl_numcpus << EOF
Defaults env_keep += "MAKEALLCPUS"
EOF

chmod 0600 ${DIR}/etc/sudoers.d/rl_numcpus
