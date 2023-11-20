#!/bin/bash

AUTOSAVE="off"
CONFFILE="/etc/rl_autosave.conf"
LOGFILE="/var/log/rl_autosave.log"
NOW=`date "+%Y%m%d %H%M%S"`
RLRC="/makesurethisdoesnotexistuntilsetproperly"

write_to_log()
{
	echo "${NOW} $1" >>${LOGFILE}
}

error()
{
	>&2 echo "$1"
	write_to_log "$1"
}

save_file()
{
	echo "Saving $1 to $2 ..."
	write_to_log "Saving $1 to $2 ..."
#	cp -a "$1" "$2/$1" || error "$1 could not be saved to $2/$1!"
	rsync -ai --fsync $1 $2
}

check_file()
{
	LIVEFILE="$1"
	SAVEDFILE="${RLRC}/${LIVEFILE}"

# if we can't find rootcopy ... bail
	if [ ! -d "${RLRC}" ]; then
		error "Invalid rootcopy (${RLRC})!"
		return
	fi

# Only files are allowed to be autosaved
	if [ ! -f "${LIVEFILE}" ]; then
		error "${LIVEFILE} is not a file ... not saving"
		return
	fi

	PDIR=`dirname ${SAVEDFILE}`
	mkdir -p ${PDIR}

	NEEDSUPDATE="x"
	NEEDSUPDATE+=`rsync -ain ${LIVEFILE} ${SAVEDFILE}`
	if [ "${NEEDSUPDATE}" == "x" ]; then
		write_to_log "${LIVEFILE} matches ${SAVEDFILE}"
	else
#		echo ${NEEDSUPDATE}
		save_file "${LIVEFILE}" "${SAVEDFILE}"
	fi
}

cd /
echo "Starting autosave ... log will be written to ${LOGFILE}"

if [ ! -r "${CONFFILE}" ]; then
	write_to_log "Invalid conf file (${CONFFILE})!"
	exit 1
fi

# Start Autosave
write_to_log "autosave started"

while read line; do
	COMMAND=$(echo "$line" | awk '{print $1}')
	TARGET=$(echo "$line" | awk '{print $2}')

	if [ "${COMMAND}" == "autosave" ]; then
		if [ "${TARGET}" == "on" ]; then
			AUTOSAVE="on";
		else
			echo "autosave is off, edit ${CONFFILE} to enable autosaving"
			exit 0
		fi
	fi

	if [ "${COMMAND}" == "rootcopydir" ]; then
		if [ -n "${TARGET}" ]; then
			RLRC="${TARGET}";
		fi
	fi

	if [ "${COMMAND}" == "savefile" ]; then
		if [ "${AUTOSAVE}" == "on" ]; then
			if [ -n "${TARGET}" ]; then
				check_file "${TARGET}"
			fi
		else
			echo "autosave is off, edit ${CONFFILE} to enable autosaving"
		fi
	fi
done <"${CONFFILE}"

# End Autosave
write_to_log "autosave complete"

sync
