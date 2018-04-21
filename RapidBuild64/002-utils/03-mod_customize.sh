#!/bin/bash

source ../spec.sh
source ./module_spec.sh

# This is already done in 001-core
SLOCATEGROUPFILE="${DIR}/etc/group"
if [ -f ${SLOCATEGROUPFILE} ]; then
  if grep -q slocate ${SLOCATEGROUPFILE} ; then
    LINES=`cat ${SLOCATEGROUPFILE} | wc -l`
    if [ "$LINES" == "1" ]; then rm ${SLOCATEGROUPFILE}; fi
  fi
fi

if [ -d ${DIR}/etc/cron.hourly ]; then
# Write an hourly sync script
SCRIPT="${DIR}/etc/cron.hourly/sync.sh"
cat << EOFF > $SCRIPT
#!/bin/bash

sync
EOFF
chmod 0700 $SCRIPT
fi

if [ -d ${DIR}/etc/cron.daily ]; then
# Write a daily backup script template
SCRIPT="${DIR}/etc/cron.daily/backup.sh"
cat << EOFF > $SCRIPT
#!/bin/bash

# Enter your backup command here
EOFF
chmod 0700 $SCRIPT
fi

# add rl_autosave.sh to /etc/cron.hourly
if [ -d ${DIR}/etc/cron.hourly ]; then
  ln -s /usr/bin/rl_autosave.sh ${DIR}/etc/cron.hourly/rl_autosave.sh
fi
