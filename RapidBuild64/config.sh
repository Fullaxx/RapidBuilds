# Make sure we have the RDL tree
rapiddeplogichceck

# Read in each modules package requests
for PKGCFG in ${PROJECTBASE}/???-*/packages.cfg.sh; do source ${PKGCFG}; done

#######################################

if [ "${INCMOD002UTILS}" == "Y" ]; then
  for DEPSCR in ${RAPIDDEPLOGIC}/002-*.sh; do source ${DEPSCR}; done
fi

if [ "${INCMOD005SERVER}" == "Y" ]; then
  for DEPSCR in ${RAPIDDEPLOGIC}/005-*.sh; do source ${DEPSCR}; done
fi

if [ "${INCMOD006DEVEL}" == "Y" ]; then
  for DEPSCR in ${RAPIDDEPLOGIC}/006-*.sh; do source ${DEPSCR}; done
fi

if [ "${INCMOD010XORG}" == "Y" ]; then
  for DEPSCR in ${RAPIDDEPLOGIC}/010-*.sh; do source ${DEPSCR}; done
fi

# Internal Library Dependencies
for DEPSCR in ${RAPIDDEPLOGIC}/009-*.sh; do source ${DEPSCR}; done
