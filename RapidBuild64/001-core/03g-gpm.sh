#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ ! -x ${DIR}/usr/sbin/gpm ]; then
  exit 0
fi

# Create the Startup Script
SCRIPT="${DIR}/etc/rc.d/rc.gpm"
cat << EOFF > $SCRIPT
#!/bin/sh
# Start/stop/restart the GPM mouse server:

BINARY="/usr/sbin/gpm"
DEVICE="/dev/mouse"
PROTO="imps2"

if [ "\$1" = "stop" ]; then
  echo "Stopping gpm..."
  \$BINARY -k
elif [ "\$1" = "restart" ]; then
  echo "Restarting gpm..."
  \$BINARY -k
  sleep 1
  \$BINARY -m \$DEVICE -t \$PROTO
else # assume $1 = start:
  echo "Starting gpm:  \$BINARY -m \$DEVICE -t \$PROTO"
  \$BINARY -m \$DEVICE -t \$PROTO
fi
EOFF

chmod 0755 $SCRIPT
