#!/bin/bash

AUTOSAVE="off"
CONFFILE="/etc/rl_autosave.conf"
LOGFILE="/var/log/rl_autosave.log"
NOW=`date "+%Y%m%d %H%M%S"`
RLRC="/makesurethisdoesnotexistuntilsetproperly"

write_to_log() {
	echo "$NOW $1" >> $LOGFILE
}

# This could be more elegant...
# All this needs to do is create all the parents directories for the incoming saved file
create_rc_dirpath() {
	touch "$1" 2>/dev/null || ( mkdir -p "$1"; rmdir "$1"; )
	if [ -f "$1" ]; then rm "$1"; fi
}

savefile_if_needed() {
	FILE="$1"
	LIVE="0"
	SAVED="0"
	
	# if we can't find rootcopy... bail
	if [ ! -d "$RLRC" ]; then
		write_to_log "Invalid rootcopy ($RLRC)!"
		return
	fi

	if [ -f "/$FILE" ]; then
		LIVE=`md5sum "/$FILE" | awk '{print $1}'`
	else
		write_to_log "/$FILE is not a file... not saving"
		return;
	fi
	
	if [ -f "$RLRC/$FILE" ]; then
		SAVED=`md5sum "$RLRC/$FILE" | awk '{print $1}'`
	else
		create_rc_dirpath "$RLRC/$FILE"
	fi
	
	if [ "$LIVE" != "$SAVED" ]; then
	  write_to_log "Saving /$FILE to $RLRC/$FILE..."
	  cp -p "/$FILE" "$RLRC/$FILE" || write_to_log "/$FILE could not be saved to $RLRC/$FILE!"
	else
	  write_to_log "/$FILE matches $RLRC/$FILE"
	fi
}

echo "Starting autosave... log will be written to $LOGFILE"

if [ ! -r "$CONFFILE" ]; then
	write_to_log "Invalid conf file ($CONFFILE)!"
	exit 1
fi

write_to_log "autosave started"

while read line; do
	command=$(echo "$line" | awk '{print $1}')
	target=$(echo "$line" | awk '{print $2}')

	if [ "$command" == "autosave" ]; then
		if [ "$target" == "on" ]; then
			AUTOSAVE="on";
		fi
	fi

	if [ "$command" == "rootcopydir" ]; then
		if [ -n "$target" ]; then
			RLRC="$target";
		fi
	fi
	
	if [ "$command" == "savefile" ]; then
		if [ "$AUTOSAVE" == "on" ]; then
			if [ -n "$target" ]; then
				savefile_if_needed "$target"
			fi
		else
			write_to_log "autosave is off, edit $CONFFILE to enable autosaving"
		fi
	fi
done < "$CONFFILE"

write_to_log "autosave complete"

sync