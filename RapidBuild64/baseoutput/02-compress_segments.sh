#!/bin/bash

source ../spec.sh
source ./module_spec.sh

countbrokenmansymlinks()
{
	LINKCOUNT="0"
	BROKENCOUNT="0"
	for SYMLINK in `find ${BDIR}/fsman/ -type l`; do
		LINKCOUNT=$(( LINKCOUNT + 1 ))
		if [ ! -e "$SYMLINK" ]; then
			if [ "$1" == "PRINT" ]; then echo "BROKEN: $SYMLINK"; fi
			BROKENCOUNT=$(( BROKENCOUNT + 1 ))
		fi
	done
	echo "Links: $LINKCOUNT - Broken: $BROKENCOUNT"
}

fixbrokenmansymlinks()
{
	for SYMLINK in `find ${BDIR}/fsman/ -type l -name "*.gz"`; do
		if [ ! -e "$SYMLINK" ]; then
			SOURCE=`ls -l ${SYMLINK} | awk '{print $9}' | sed 's@\.gz@@'`
			TARGET=`ls -l ${SYMLINK} | awk '{print $11}' | sed 's@\.gz@@'`
			#echo "Fixing ${SOURCE} -> ${TARGET} ..."
			rm "$SYMLINK"
			ln -s "${TARGET}" "${SOURCE}"
		fi
	done
}

echo "Colocating man pages ..."
find ${BDIR}/fsman/ -type f -name "*.gz" -exec gunzip {} \;
countbrokenmansymlinks
fixbrokenmansymlinks
countbrokenmansymlinks PRINT
dir2xzm ${BDIR}/fsman 020-man.xzm >/dev/null || exit 1

echo "Colocating documentation ..."
find ${BDIR}/fsdoc/ -type f -name "*.gz" -exec gunzip {} \;
dir2xzm ${BDIR}/fsdoc 021-doc.xzm >/dev/null || exit 1

if [ -e 003-interp.xzm -a -d ${BDIR}/fspython ]; then
  echo "Colocating python code ..."
  rm 003-interp.xzm
  dir2xzm ${BDIR}/fspython 003-interp.xzm >/dev/null || exit 1
fi

if [ -e 006-devel.xzm -a -d ${BDIR}/fsdevel ]; then
  echo "Colocating dev headers ..."
  rm 006-devel.xzm
  dir2xzm ${BDIR}/fsdevel 006-devel.xzm >/dev/null || exit 1
fi

rm -r ${BDIR}