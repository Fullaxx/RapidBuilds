#!/bin/bash
# script by jayflood created Jan 2010

USER=`whoami`
CONFIG="/$USER/.kde/share/config/slaxscripts/modtoolsrc"
CONFPATH="/$USER/.kde/share/config/slaxscripts"
WRK1="/tmp/convertmod/in"
WRK2="/tmp/convertmod/out"
WRK3="/tmp/convertmod/tmp"
WRKBASE="/tmp/convertmod"
HELPTXT="$CONFPATH/modtools-help.txt"

# Cleanup any existing working dir
if [ -d $WRK1 ]; then
	rm -rf $WRK1
fi

if [ -d $WRK2 ]; then
	rm -rf $WRK2
fi

if [ -d $WRK3 ]; then
	rm -rf $WRK3
fi

helpme()
{
if [ ! -f $HELPTXT ]; then
	touch $HELPTXT

cat << EOF > $HELPTXT
#######################################
SLAX MODULE TOOLS - by jayflood
#######################################

THIS SCRIPT SUPPORT DRAG AND DROPPING OF FILE/FOLDERS

Upon first run, this script will ask you to point the way to your slax optional 
modules folder. You will only be asked this once and a config file will be placed at:
$CONFPATH/modtoolsrc
.
_______________
ACTIVATE MODULE

Type in the beginning of a module's name and it will be activated. You can prepend all
of your office apps with "office" (e.g office-gcalc.lzm) and activate then all by
typing in "office". Once setup this script works separate from the modtools. You can
simply open a terminal and type for e.g 'act office'
.
_______________
ACTIVATE FOLDER

Type in the name of a folder in your optional modules directory and all of the modules
inside will be activated. This is useful if you store all modules with dependencies in
one single folder. You can activate and deactivate them whenever you please.
.
_______________
UNPACK MODULE

Unpack a module into a directory so you can browse and edit the files. You can
use the 'create module' menu to make a module after you've finished editing.
.
_______________
CREATE MODULE

Create a module from a folder that you specify. For example you may want to
create a bash profile. Create the folders /rootcopy/root/ and put you bash
inside this. (e.g /rootcopy/root/.bash_profile) and make it into a module.
.
_______________
MERGE MODULES

When you want to merge your modules together use this option. Perhaps you have
made some modules from your changes directory? You can merge them together with
this option and place the single resulting module in place of the many.
.
_______________
TGZ TO MODULE

Converts a slackware .tgz package into a s;ax compatible .lzm module. The
module is unpack, then stripped of unnecessary files before being repacked
as a slax module.
.
_______________
TXZ TO MODULE

Converts a slackware .txz package into a s;ax compatible .lzm module. The
module is unpack, then stripped of unnecessary files before being repacked
as a slax module.
.
___________________
MERGE TGZ TO MODULE

Choose a folder full of .tgz slackware packages and they will be merged into
a single slax compatible modules. The tgz files are unpacked, then stripped
of unnecessary files before being repacked as a slax .lzm module.
.
___________________
MERGE TZX TO MODULE

Choose a folder full of .txz slackware packages and they will be merged into
a single slax compatible modules. The txz files are unpacked, then stripped
of unnecessary files before being repacked as a slax .lzm module.
.
_______________
REMOVE CONFIG

When you first run this script it places a config file in the following path:
$CONFPATH/modtoolsrc. This tells the script that you have already used it
before and there is no need to download anyhting. It also uses this config
to find the place that you keep all of your modules. Remove the config if
you want to store your modules in a different place, or you made a mistake
with the path in the first instance.
.
EOF
	else
clear
cat $HELPTXT | less
fi
}

modpath()
{
echo
echo "*****************************************************************************"
echo "Please type in the path to your slax optional module folder and press enter. "
echo "This is the folder that you keep all of your modules in. You will only need to "
echo "enter this path once and a configuration file will be saved."
echo
read MODFOLDER

if [ ! -d "$MODFOLDER" ]; then
	echo
	echo "You must select a module folder to continue. "
	echo "You will only have to enter this path once"
	exit
		else 
		mkdir -p $CONFPATH
		touch $CONFIG
		echo "[modfolder]" > $CONFIG
		echo $MODFOLDER >> $CONFIG
	fi
}

#dload()
#{
#echo
#echo "Squashfs-tools was not found. Type [y] to download the 800kb file now."
#read -s -n1 squashfs
#echo
#if [ "$squashfs" == "Y" -o "$squashfs" == "y" ]; then
#	cd $MODFOLDER
#	wget http://www.slax.org/modules/3155/dl/squashfs4-tools.lzm
#	activate squashfs4-tools.lzm
#	sleep 1
#		else
#		echo "OK, but you will need squashfs tools to create squashfs4 modules"
#	exit
#fi
#}

#netcheck()
#{
#if eval "ping -c 1 208.67.222.222"; then
#	dload
#		else
#		echo
#		echo "************************************************************"
#		echo "Squashfs-tools was not found. Please connect to the intenet "
#		echo "and the tools will be downloaded (800kb)."
#		echo
#	exit 1
#fi
#}

########## CONFIG FOLDER CHECK ##########
#########################################

if [ -f $CONFIG ]; then
	MODFOLDER=$(grep -A1 "[modfolder]" $CONFIG | tail -1)
		else
		modpath
	MODFOLDER=$(grep -A1 '[modfolder]' $CONFIG | tail -1)
fi

LIVE=$(echo $MODFOLDER | awk -F / '{print$3}')
#SQSH4OPT=$(find $MODFOLDER -type f -name squashfs4-tools.lzm | wc -l)
#SQSH4LO=$(losetup -a | grep squashfs4-tools | wc -l)
#SQSH4ROOT=$( ls /root | grep sqashfs4 | wc -l)

#chksquash()
#{
#if [ $SQSH4OPT -eq 1 -a $SQSH4LO -eq 0 ]; then 
#	activate $MODFOLDER/squashfs4-tools.lzm
#		elif
#			[ $SQSH4OPT -eq 0 -a $SQSH4LO -eq 0 ]; then
#			netcheck
#fi
#}

#cmodule()
#{
#mkdir -p $WRK1
#mkdir -p $WRK2
#	echo
#	echo "Enter the path to the module you want to "
#	echo "convert from squashfs3 to squashfs3"
#	echo "E.g /mnt/hda3/slax/optional/module.lzm"
#	echo
#	echo -e "\033[1mYou can also drag and drop the file here\033[0m"
#	echo
#	read CON
#		CON=`echo $CON | tr -d "'"` > /dev/null 2>&1
#		FILE=$(echo $CON | awk -F/ '{print$NF}')
#		if [ -f $CON ]; then
#		NAME=`echo $CON | awk -F/ '{print $NF}' | sed 's/\(.*\)\..*/\1/'`
#		ext=${FILE##*.}
#			if [ "$ext" != "lzm" ]; then
#			echo
#			echo "########################"
#			echo "Ths is not an .lzm file"
#			echo
#			cmodule
#			fi
#		echo "Unpacking .lzm module now ......"
#		unsquashfs3 -f -dest $WRK1 $CON
#		echo "Creating sq4 module now ......"
#		mksquashfs $WRK1 $MODFOLDER/$NAME.sq4.lzm -b 256K;
#	echo
#	clear
#	echo "####################################################"
#	echo "Your module was successfully converted to squashfs4 "
#	echo 
#	echo -e "\033[1m$MODFOLDER/$NAME.sq4.lzm\033[0m"
#	echo
#	exit
#		else
#		echo 
#		echo "#####################################################"
#		echo "Sorry you may have mis-typed the path to your module."
#		echo "No module was found at the path you entered"
#		sleep 4
#		echo
#		cmodule
#	exit
#fi
#}

#cfolder()
#{
#CON=`echo $CON | tr -d "'"` > /dev/null 2>&1
#if [ -d $CON ]; then
#for mod in $(find $CON -type f -name "*.lzm" | head -1); do
#	NAME=$(echo $mod | awk -F/ '{print $NF}' | sed 's/\(.*\)\..*/\1/')
#	echo
#	cp $mod $WRK3;
#	mkdir -p $WRK1;
#	echo "Unpacking module $NAME ... please wait"
#	unsquashfs3 -f -dest $WRK1 $mod;
#	echo
#	echo "Creating sq4 module $NAME now ......"
#	mksquashfs $WRK1 $WRK2/$NAME.sq4.lzm -b 256K; 
#	rm -f $mod;
#	rm -rf $WRK1;
#done

#while [ $(find $CON -type f -name "*.lzm" | head -1 | wc -l) -eq 1 ]; do
#	cfolder
#done
#	mv $WRK2/* $CON
#	mv $WRK3/*.* $CON
#	rm -rf $WRKBASE
#	sleep 2
#	clear
#	echo
#	echo "######################################################"
#	echo "Your modules were successfully converted. They are in "
#	echo
#	echo -e "\033[1m$CON folder\033[0m"
#	echo
#	exit
#		else
#	echo
#	echo "###################################################"
#	echo "Sorry you must have mistyped the path. No folder is"
#	echo "found in the path you gave ... try again"
#	echo
#	cfolder
#fi
#exit
#}

activ()
{
clear
if [ -f /usr/bin/act ]; then
	echo 
	echo "The script has already been setup"
	echo
	bash /usr/bin/act
	echo
	echo -e "\033[1mThe act script works independently of other scripts\033[0m"
	echo -e "\033[1mYou don't need to start this script to use 'act'\033[0m"
	echo
		else
		if [ "$USER" != "root" ]; then
			echo "You must be root to set up this script!"
			exit
		fi
		echo
		echo "Setting up activate modules script"
		cp /opt/slaxscripts/act.txt /usr/bin/act
		chmod +x /usr/bin/act
		echo 
		echo "###########################################"
		echo "Your activation script has now been setup."
		echo
		bash /usr/bin/act
	fi
exit
}

unpackmod()
{
ls $MODFOLDER
echo
echo "Enter the path to the module that you want to unpack to a folder"
echo "E.g /mnt/sda1/slax/optional/myModule.lzm"
echo
echo -e "\033[1mYou can also drag and drop the module here\033[0m"
echo
read UMODULE

UMODULE=`echo $UMODULE | tr -d "'"` > /dev/null 2>&1
if [ -f "$UMODULE" ]; then 
	MODNAME=$(echo $UMODULE | sed 's/\(.*\)\..*/\1/')
	mkdir $MODNAME
	echo "Unpacking $MODNAME now ......"
	lzm2dir $UMODULE $MODNAME
	clear
	echo
	echo "######################################"
	echo "Your module was successfully unpacked:"
	echo "You can find it here:"
	echo 
	echo -e "\033[1m$MODNAME\033[0m"
	echo
	exit
		else
		echo 
		echo "*****************************************************"
		echo "Sorry you must have mis-typed the path to the module."
		echo "No module was found there. Please try again"
		echo 
		sleep 5
		unpackmod
exit
fi
}

fold2mod()
{
echo
echo "Please enter the path fo the folder you want to make a module from:"
echo "E.g /mnt/hda3/slax/optional/folder"
echo -e "\033[1mYou can also drag and drop the folder here\033[0m"
read FMOD

FMOD=`echo $FMOD | tr -d "'"` > /dev/null 2>&1
if [ ! -d $FMOD ]; then 
	echo
	echo "***********************************************"
	echo "Sorry, you must have typed the path incorrectly"
	sleep 4
	fold2mod
	exit 
		else
		echo
		echo "Please enter name for module WITHOUT .lzm at the end"
		read FMODNAME
		dir2lzm $FMOD $FMOD/$FMODNAME.sq4.lzm
		clear
		echo 
		echo "##########################################"
		echo "Your module has been created. Find it at :"
		echo
		echo -e "\033[1m$FMOD/$FMODNAME.sq4.lzm\033[0m"
		echo
	fi
exit	
}

mergemods()
{
echo
echo "Please enter the path to the folder containing the modules"
echo "E.g /mnt/sda3/slax/optional/folder"
echo "You can also drag and drop the folder here."
echo
read MMOD

MMOD=`echo $MMOD | tr -d "'"` > /dev/null 2>&1
if [ ! -d $MMOD ]; then 
	echo
	echo "*************************************************"
	echo "Sorry, you might have typed the path incorrectly"
	echo "No folder was found at the path you typed, try again."
	echo 
	sleep 5
	mergemods	
		else
			TARGETS=$(ls $MMOD/*.lzm)
			mkdir $MMOD/tmp
			echo "Unpacking modules ..."
			for mm in $TARGETS; do
			lzm2dir $mm $MMOD/tmp
			done
		echo
		echo "Enter a name for new module WITHOUT .lzm at end"
		read NEWM
		echo "Repacking modules ... be patient"
		dir2lzm $MMOD/tmp $MMOD/$NEWM.sq4.lzm
		rm -rf $MMOD/tmp
	clear
	echo
	echo "###############################" 
	echo "Your module has been created!!"
	echo
	echo -e "\033[1m$MMOD/$NEWM.sq4.lzm\033[0m"
	echo
fi
exit
}

tgz-lzm()
{
echo
echo "Please enter the path to the .tgz file you want to convert"
echo "For example: /mnt/slax/optional/myModule.tgz"
echo
echo -e "\033[1mYou can also drag and drop the file here\033[0m"
echo
read tgz
	tgz=`echo $tgz | tr -d "'"` > /dev/null 2>&1
	if [ ! -f $tgz ]; then 
	echo 
	echo "************************************************"
	echo "Sorry, no file was found at the path you entered"
	echo "Perhaps you mis-typed the path, try again ..."
	sleep 4
	tgz-lzm
	exit 
		else
		tgzname=$(echo $tgz | awk -F/ '{print$NF}')
		name=$(echo $tgzname | sed 's/\(.*\)\..*/\1/')
		ext=${tgzname##*.}
			if [ "$ext" != "tgz" ]; then
			echo
			echo "######################"
			echo "Ths is not a .tgz file"; tgz-lzm
			fi
		mkdir -p $WRKBASE/tmpwrk
		cp $tgz $WRKBASE/tmpwrk
		pushd $WRKBASE/tmpwrk
		echo
		echo "Unpacking file now ..."
		gunzip $name.tgz
		echo
		tar xf $name.tar
		echo "Stripping file now ..."
			if [ -d usr/man ]; then
			find usr/man -type l -name "*.gz" | xargs -r gunzip -f > /dev/null 2>&1
			find . | xargs file | grep ELF | cut -f 1 -d : | xargs strip --strip-unneeded > /dev/null 2>&1
			else
			find . | xargs file | grep ELF | cut -f 1 -d : | xargs strip --strip-unneeded > /dev/null 2>&1
			fi
		if [ -d install ]; then
		rm -rf instal*
		fi
		rm -f *.tar
		popd
		echo "Repacking file as slax module now ..."
		dir2lzm $WRKBASE/tmpwrk $MODFOLDER/$name.sq4.lzm
		rm -rf $WRKBASE
		clear
		echo
		echo "######################################################"
		echo "Your tgz file has been converted and can be found at: "
		echo 
		echo -e "\033[1m$MODFOLDER/$name.sq4.lzm\033[0m"
		echo
	exit 
fi 
}

txz-lzm()
{
echo
echo "Please enter the path to the .txz file you want to convert"
echo "For example: /mnt/slax/optional/myFile.txz"
echo
echo -e "\033[1mYou can also drag and drop the file here\033[0m"
read txz
	txz=`echo $txz | tr -d "'"` > /dev/null 2>&1
	if [ ! -f $txz ]; then 
	echo 
	echo "************************************************"
	echo "Sorry, no file was found at the path you entered"
	echo "Perhaps you mis-typed the path, try again ..."
	sleep 5
	txz-lzm
	exit 
	else
		
		txzname=$(echo $txz | awk -F/ '{print$NF}')
		name=$(echo $txzname | sed 's/\(.*\)\..*/\1/')
		ext=${txzname##*.}
			if [ "$ext" != "txz" ]; then
			echo "Ths is not a .txz file"; exit
			fi
		mkdir -p $WRKBASE/tmpwrk
		cp $txz $WRKBASE/tmpwrk
		pushd $WRKBASE/tmpwrk
		echo "Unpacking file now ..."
		xz -d $name.txz
		echo
		echo "Stripping files now ..."
		tar xf $name.tar
			if [ -d usr/man ]; then
			find usr/man -type l -name "*.gz" | xargs -r gunzip -f > /dev/null 2>&1
			find . | xargs file | grep ELF | cut -f 1 -d : | xargs strip --strip-unneeded > /dev/null 2>&1
			else
			find . | xargs file | grep ELF | cut -f 1 -d : | xargs strip --strip-unneeded > /dev/null 2>&1
			fi
		if [ -d install ]; then
		rm -rf instal*
		fi
		rm -f *.tar
		popd
		echo "Repacking file as slax module now ..."
		dir2lzm $WRKBASE/tmpwrk $MODFOLDER/$name.sq4.lzm
		rm -rf $WRKBASE
		clear
		echo
		echo "######################################################"
		echo "Your tgz file has been converted and can be found at: "
		echo
		echo -e "\033[1m$MODFOLDER/$name.sq4.lzm\033[0m"
		echo 
	exit 
fi 
}

mtgz-lzm()
{
echo
echo "Please enter the path to the folder you want to convert"
echo "For example: /mnt/slax/optional/myFolder"
echo
echo -e "\033[1mYou can also drag and drop the folder here\033[0m"
echo
read FTGZ

FTGZ=`echo $FTGZ | tr -d "'"` > /dev/null 2>&1
if [ ! -d $FTGZ ]; then 
	echo
	echo "****************************************************"
	echo "Sorry, no folder was found in the path that you gave"
	sleep 3
	mtgz-lzm
	exit 
		else
		TGZTARGET=$(find $FTGZ -name *.tgz)
		mkdir $FTGZ/tmpwrk
		echo "Making a copy of modules now ....."
		for a in $TGZTARGET; do cp $a $FTGZ/tmpwrk; done
		TGZTARGET2=$(find $FTGZ/tmpwrk -maxdepth 1 -name *.tgz)
		echo "Unpacking .tgz files now ....."
		for b in $TGZTARGET2; do gunzip $b; done
		TARS=$(ls $FTGZ/tmpwrk)
		cd $FTGZ/tmpwrk
		echo "Cleaning up unwanted files now ....."
		for c in $TARS; do tar xvf $c; rm -f $c; done
			if [ -d install ]; then
			rm -rf instal*
			fi
			if [ -d tmpwrk/usr/man ]; then
			find usr/man -type l -name "*.gz" | xargs -r gunzip -f > /dev/null 2>&1
			fi
			find . | xargs file | grep ELF | cut -f 1 -d : | xargs strip --strip-unneeded > /dev/null 2>&1
		echo
		echo "####################################################"
		echo "Please enter a name for your module WITHOUT the sq4.lzm"
		echo
		read MNAME
		cd $FTGZ
		echo
		echo "Creating your module now ... please be patient."
		dir2lzm tmpwrk $FTGZ/$MNAME.sq4.lzm
	rm -rf tmpwrk
	echo
	clear
	echo "################################################"
	echo "Your .tgz files have been merged into a module:"
	echo
	echo -e "\033[1m$FTGZ/$MNAME.sq4.lzm\033[0m"
	echo
	exit
fi
exit
}


mtxz-lzm()
{
clear
echo
echo "Please enter the path to the folder you want to convert"
echo "For example: /mnt/slax/optional/myFolder"
echo
echo -e "\033[1mYou can also drag and drop the folder here\033[0m"
echo
read FTXZ
	FTXZ=`echo $FTXZ | tr -d "'"` > /dev/null 2>&1
	if [ ! -d $FTXZ ]; then 
	echo
	echo "************************************************"
	echo "Sorry, no folder was found in the path you gave!"
	echo
	sleep 4
	mtxz-lzm 
	else
		TXZTARGET=$(find $FTXZ -name *.txz)
		mkdir $FTXZ/tmpwrk
		echo "Making a copy of files now ....."
		for a in $TXZTARGET; do cp $a $FTXZ/tmpwrk; done
		TXZTARGET2=$(find $FTXZ/tmpwrk -maxdepth 1 -name *.tgz)
		echo
		echo "Unpacking .txz file now ....."
		for b in $TXZTARGET2; do xz -d $b; done
		TARS=$(ls $FTXZ/tmpwrk)
		cd $FTXZ/tmpwrk
		echo
		echo "Removing unwanted files now ..."
		for c in $TARS; do tar xvf $c; rm -f $c; done
			if [ -d install ]; then
			rm -rf instal*
			fi
			if [ -d tmpwrk/usr/man ]; then
			find usr/man -type l -name "*.gz" | xargs -r gunzip -f > /dev/null 2>&1
			fi
			find . | xargs file | grep ELF | cut -f 1 -d : | xargs strip --strip-unneeded > /dev/null 2>&1
		echo
		echo "Please enter a name for your module WITHOUT the sq4.lzm"
		read MNAME
		cd $FTXZ
		echo
		echo "Creating final module ... please be patient."
		dir2lzm tmpwrk $FTXZ/$MNAME.sq4.lzm
	rm -rf tmpwrk
	clear	
	echo
	echo "################################################"
	echo "Your .txz files have been merged into a module:"
	echo
	echo -e "\033[1m$FTXZ/$MNAME.sq4.lzm\033[0m"
	echo
	exit
fi
exit
}


##### BEGIN GUI MENU ######################################
clear
echo
echo -e '\E[37;44m'"\033[1m###############################\033[0m"
echo -e '\E[37;44m'"\033[1m##### SLAX MOD TOOLS MENU #####\033[0m"
echo
echo "1). Setup activate module" 
echo "2). Setup activate folder" 
echo "3). Unpack a single module" 
echo "4). Create a module from folder" 
echo "5). Merge multiple modules into one" 
echo "6). Convert .tgz file to .lzm module" 
echo "7). Convert .txz file to .lzm module" 
echo "8). Merge .tgz files into module"
echo "9). Merge .txz files into module"
echo "10). Remove config file"
echo "11). Help file"
echo
echo -e "\033[1mPlease enter a number from the menu:\033[0m"
echo -e "\033[1mPress enter when done.\033[0m"

read CHOICE
############## END GUI MENU ###############################

if [ "$CHOICE" == "1" -o "$CHOICE" == "2" ]; then
	activ
	exit
fi

if [ $CHOICE == "10" ]; then
	if [ -d $CONFPATH ]; then
	rm -rf $CONFPATH
		else
		echo
		echo "No config file was found!"
	fi
fi

#if [ $CHOICE == "3" ]; then
#	clear
#	cmodule	
#fi


#if	[ $CHOICE == "4" ]; then
#	mkdir -p $WRK2
#	mkdir -p $WRK3
#	clear
#	echo
#	echo "Please enter the path to a folder with the modules"
#	echo "that you want to merge into a single module."
#	echo "E.g /mnt/hda3/slax/optional/folder"
#	echo
#	echo -e "\033[1mYou can also drag and drop the folder here\033[0m"
#	echo
#	read CON
#	cfolder
#fi 

if [ $CHOICE == "3" ]; then
	clear
	unpackmod
fi

if [ $CHOICE == "4" ]; then
	clear
	fold2mod
fi

if [ $CHOICE == "5" ]; then
	clear
	mergemods
fi

if [ $CHOICE == "6" ]; then
	clear
	tgz-lzm
fi

if [ $CHOICE == "7" ]; then
	clear
	txz-lzm
fi

if [ $CHOICE == "8" ]; then
	clear
	mtgz-lzm
fi

if [ $CHOICE == "9" ]; then
	clear
	mtxz-lzm
fi

if [ $CHOICE == "11" ]; then
	clear
	helpme
fi

echo
echo "******************************************"
echo -e "\033[1mYou must choose an option from the menu only!\033[0m"
echo

exit