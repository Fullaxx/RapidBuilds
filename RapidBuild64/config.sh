
for PKGCFG in ${PROJECTBASE}/???-*/packages.cfg.sh; do source ${PKGCFG}; done

### DEP TRACKING ######################

if [ "${INCMOD004JAVA}" == "Y" ]; then
  INCLIBXSLT="Y"
fi

#######################################

rapiddeplogichceck

if [ "${INCMOD002UTILS}" == "Y" ]; then
  for DEPSCR in ${RAPIDDEPLOGIC}/002-*.sh; do source ${DEPSCR}; done
fi

if [ "${INCMOD005SERVER}" == "Y" ]; then
  for DEPSCR in ${RAPIDDEPLOGIC}/005-*.sh; do source ${DEPSCR}; done
fi

for DEPSCR in ${RAPIDDEPLOGIC}/009-*.sh; do source ${DEPSCR}; done

if [ "${INCMOD006DEVEL}" == "Y" ]; then
  INCLIBCROCO="Y"
fi

for DEPSCR in ${RAPIDDEPLOGIC}/006-*.sh; do source ${DEPSCR}; done

