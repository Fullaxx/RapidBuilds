rapiddeplogichceck()
{
  if [ -z "${RAPIDDEPLOGIC}" ]; then
    echo "RAPIDDEPLOGIC not defined in spec.sh!"
    exit 1
  fi

  if [ ! -d "${RAPIDDEPLOGIC}" ]; then
    echo "${RAPIDDEPLOGIC} not found!"
    exit 1
  fi
}

kernelcheck()
{
  if [ -z "${KERNELPKGDIR}" ]; then
    echo "KERNELPKGDIR not defined in spec.sh!"
    exit 1
  fi

  if [ ! -d ${KERNELPKGDIR} ]; then
    echo "${KERNELPKGDIR} not found!"
    exit 1
  fi
}

rootcheck()
{
  if [ `id -u` != "0" ]; then
    echo "Got Root?"
    exit 1
  fi
}

linkmodule()
{
  ln -s "$1"
  if [ ! -e "$1" ]; then
    echo "$1 does not exist..."
    exit 1
  fi
}

bail()
{
  echo "$1"
  exit 1
}

loadconfig()
{
  CONFIGFILE="${PROJECTBASE}/config.sh"
  if [ ! -r ${CONFIGFILE} ]; then
    echo "${CONFIGFILE} not found!"
    exit 1
  fi
  source "${CONFIGFILE}"
}
