slackwarecheck()
{
  if [ -z "${SLACKPKGDIR}" ]; then
    echo "SLACKPKGDIR not defined in spec.sh!"
    exit 1
  fi

  if [ ! -d ${SLACKPKGDIR} ]; then
    echo "${SLACKPKGDIR} not found!"
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

shellcheck()
{
  if [ -z "${RLSHELL}" ]; then
    echo "RLSHELL not defined in spec.sh!"
    exit 1
  fi

  if [ ! -f ${RLSHELL} ]; then
    echo "${RLSHELL} not found!"
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

rapidbasecheck()
{
  if [ -z "${PROJECTBASE}" ]; then
    echo "PROJECTBASE not defined in spec.sh!"
    exit 1
  fi

  if [ ! -d "${PROJECTBASE}" ]; then
    echo "${PROJECTBASE} not found!"
    exit 1
  fi
}

rapiddeplogiccheck()
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

loadrdllibs()
{
# enable
  shopt -s nullglob

  if [ "${INCMOD012XAPPS}" == "Y" ]; then
    for DEPSCR in ${RAPIDDEPLOGIC}/libs/012-*.sh; do source ${DEPSCR}; done
  fi

  if [ "${INCMOD010XORG}" == "Y" ]; then
    for DEPSCR in ${RAPIDDEPLOGIC}/libs/010-*.sh; do source ${DEPSCR}; done
  fi

  if [ "${INCMOD006DEVEL}" == "Y" ]; then
    for DEPSCR in ${RAPIDDEPLOGIC}/libs/006-*.sh; do source ${DEPSCR}; done
  fi

  if [ "${INCMOD005SERVER}" == "Y" ]; then
    for DEPSCR in ${RAPIDDEPLOGIC}/libs/005-*.sh; do source ${DEPSCR}; done
  fi

  if [ "${INCMOD003INTERP}" == "Y" ]; then
    for DEPSCR in ${RAPIDDEPLOGIC}/libs/003-*.sh; do source ${DEPSCR}; done
  fi

  if [ "${INCMOD002UTILS}" == "Y" ]; then
    for DEPSCR in ${RAPIDDEPLOGIC}/libs/002-*.sh; do source ${DEPSCR}; done
  fi

# Internal Library Dependencies
  for DEPSCR in ${RAPIDDEPLOGIC}/libs/009-*.sh; do source ${DEPSCR}; done

# disable
  shopt -u nullglob
}

loadrdlapps()
{
# enable
  shopt -s nullglob

  if [ "${INCMOD012XAPPS}" == "Y" ]; then
    for DEPSCR in ${RAPIDDEPLOGIC}/apps/012-*.sh; do source ${DEPSCR}; loadrdllibs; done
  fi

  if [ "${INCMOD010XORG}" == "Y" ]; then
    for DEPSCR in ${RAPIDDEPLOGIC}/apps/010-*.sh; do source ${DEPSCR}; loadrdllibs; done
  fi

  if [ "${INCMOD006DEVEL}" == "Y" ]; then
    for DEPSCR in ${RAPIDDEPLOGIC}/apps/006-*.sh; do source ${DEPSCR}; loadrdllibs; done
  fi

  if [ "${INCMOD005SERVER}" == "Y" ]; then
    for DEPSCR in ${RAPIDDEPLOGIC}/apps/005-*.sh; do source ${DEPSCR}; loadrdllibs; done
  fi

  if [ "${INCMOD003INTERP}" == "Y" ]; then
    for DEPSCR in ${RAPIDDEPLOGIC}/apps/003-*.sh; do source ${DEPSCR}; loadrdllibs; done
  fi

  if [ "${INCMOD002UTILS}" == "Y" ]; then
    for DEPSCR in ${RAPIDDEPLOGIC}/apps/002-*.sh; do source ${DEPSCR}; loadrdllibs; done
  fi

# disable
  shopt -u nullglob
}

loadconfig()
{
  slackwarecheck
  kernelcheck
  shellcheck
  rapidbasecheck
  rapiddeplogiccheck
  rootcheck

# enable
  shopt -s nullglob

# Read in each modules package requests
  for PKGCFG in ${PROJECTBASE}/???-*/packages.cfg.sh; do source ${PKGCFG}; loadrdlapps; done

# disable
  shopt -u nullglob
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

#loadconfig()
#{
#  CONFIGFILE="${PROJECTBASE}/config.sh"
#  if [ ! -r ${CONFIGFILE} ]; then
#    echo "${CONFIGFILE} not found!"
#    exit 1
#  fi
#  source "${CONFIGFILE}"
#}
