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
	echo "Saving $1 to $2/$1 ..."
	write_to_log "Saving $1 to $2/$1 ..."
	cp -a "$1" "$2/$1" || error "$1 could not be saved to $2/$1!"
}

check_file()
{
	FILE="$1"
	LIVESUM="init"
	SAVEDSUM="none"

# if we can't find rootcopy ... bail
	if [ ! -d "${RLRC}" ]; then
		error "Invalid rootcopy (${RLRC})!"
		return
	fi

# Only files are allowed to be autosaved
	if [ -f "${FILE}" ]; then
		LIVESUM=`md5sum "${FILE}" | awk '{print $1}'`
	else
		error "${FILE} is not a file ... not saving"
		return
	fi

# Grab the md5sum of saved file in rootcopy
# or make all the parents in rootcopy for first save
	if [ -f "${RLRC}/${FILE}" ]; then
		SAVEDSUM=`md5sum "${RLRC}/${FILE}" | awk '{print $1}'`
	else
		PDIR=`dirname ${RLRC}/${FILE}`
		mkdir -p ${PDIR}
	fi

	if [ "${LIVESUM}" == "${SAVEDSUM}" ]; then
		write_to_log "${FILE} matches ${RLRC}/${FILE}"
	else
		save_file "${FILE}" "${RLRC}"
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
