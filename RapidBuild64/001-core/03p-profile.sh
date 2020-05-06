#!/bin/bash

source ../spec.sh
source ./module_spec.sh

sed -e 's#\\u@\\h:\\w#[\\u@\\h (\\w)]#' -i ${DIR}/etc/profile
sed -e 's/export LESS="-M"/export LESS="-M -r"/' -i ${DIR}/etc/profile
sed -e 's#MANPATH=/usr/local/man:/usr/man#MANPATH=/usr/man#' -i ${DIR}/etc/profile
sed -e 's#/usr/local/bin:/usr/bin:/bin:/usr/games#/usr/bin:/bin#' -i ${DIR}/etc/profile
sed -e 's#PATH=/usr/local/sbin:/usr/sbin:/sbin#PATH=/usr/sbin:/sbin#' -i ${DIR}/etc/profile

sed -e 's/export LANG=en_US.UTF-8/#export LANG=en_US.UTF-8/g' -i ${DIR}/etc/profile.d/lang.sh
sed -e 's/#export LANG=C/export LANG=C/g' -i ${DIR}/etc/profile.d/lang.sh

cat << EOFF >> ${DIR}/etc/skel/.bashrc
PS1='[\u@\h (\w)]\$ '
EOFF
chmod 0644 ${DIR}/etc/skel/.bashrc

cat << EOFF >> ${DIR}/root/.bashrc
PS1='[\u@\h (\w)]\$ '
EOFF
chmod 0644 ${DIR}/root/.bashrc

# https://unix.stackexchange.com/questions/26676/how-to-check-if-a-shell-is-login-interactive-batch
# https://serverfault.com/questions/146745/how-can-i-check-in-bash-if-a-shell-is-running-in-interactive-mode

# if we need to test for an interactive shell
# if [[ $- == *i* ]]; then
#   do_interactive_stuff
# fi

# So ~/.bashrc is only sourced for interactive shells.
# Sometimes, people source it from ~/.bash_profile or ~/.profile
# which is incorrect since it interferes with the expected behavior.
# If you want to simplify maintenance of code that is common,
# you should use a separate file to contain the common code
# and source it independently from both rc files.

# It's best if there is no output to stdout from login rc files
# such as ~/.bash_profile or ~/.profile
# since it can interfere with the proper operation of rsync for example.
