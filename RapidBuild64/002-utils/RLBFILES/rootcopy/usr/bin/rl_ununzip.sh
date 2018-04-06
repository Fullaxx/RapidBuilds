#!/bin/bash

if [ -n "$1" ]; then
  FILE="$1"
else
  echo "$0 filename.zip"
  exit 1
fi

# http://www.commandlinefu.com/commands/view/9536/un-unzip-a-file

unzip -l $FILE | awk '{ if($4 != "Name" && $4 != "----") print $4}' | xargs -t rm -rf {}


# https://gist.github.com/mieky/5546743
# unzip -l $1 | awk '{ if($4 != "Name" && $4 != "----") print $4}' | xargs -t rm -rf {} &> /dev/null

# http://superuser.com/questions/550837/how-to-unextract-a-zip-file

# Delete all extracted files, no directories:
# unzip -lqq file.zip | gawk -F"  " '{print $NF;}' | while IFS= read -r n; do rm "$n"; done

# Delete extracted files and empty directories only
# unzip -lqq file.zip | gawk -F"  " '{print $NF;}' | while IFS= read -r n; do rm "$n"; done; rmdir *

# With no options, rmdir deletes only empty directories,
# it will leave files and non-empty folders alone so you can safely run it on *.

# Delete everything extracted, but prompt for a confirmation before each deletion:
# unzip -lqq file.zip | gawk -F"  " '{print $NF;}' | while IFS= read -r n; do rm -ri "$n"; done; rmdir *

# The -i flag will cause rm to prompt before every removal, you can choose Yes or No.

# Delete everything extracted, directories included:
# unzip -lqq file.zip | gawk -F"  " '{print $NF;}' | while IFS= read -r n; do rm -rf "$n"; done
