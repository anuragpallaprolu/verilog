#!/bin/sh

# mos2nrn2 zipfile simdir running

ARCH=x86_64
if test "x${NRNHOME}" = x ; then
	prefix="/usr/local/nrn"
	exec_prefix="/usr/local/nrn/x86_64"
	NRNBIN="${exec_prefix}/bin/"
else
	prefix="$NRNHOME"
	exec_prefix="${prefix}/${ARCH}"
	NRNBIN="${exec_prefix}/bin/"
fi

if test "${NRNHOME_EXEC}" != "" ; then
	exec_prefix="${NRNHOME_EXEC}"
	NRNBIN="${exec_prefix}/bin/"
fi

if  [ "$3" = "1" ] ; then
	echo "Already running neuron controlled by mosaic.
Must quit that instance before running another."
	read a
	exit 0
fi

current=`pwd`

simdir=$2

askread="yes"

doclean() {
	if test "$a" = "y" ; then
		echo "removing $simdir"
		cd $simdir/..
		rm -r $simdir 
	else
		echo " not removing $simdir"
	fi      
	sleep 2
	exit 0
}

cleanup() {
	a=y
    if test "$askread" = "yes" ; then
	echo "Clean up by removing directory $simdir ? (n/y):$a"
	read a
    fi
	if test "$a" = "" ; then
		a=y
	fi
	doclean
}

asklaunch() {
	a=C
    if test "$askread" = "yes" ; then
	echo "[C]lean up by removing directory $simdir,
[R]elaunch NEURON,
or immediately e[X]it ? (C/R/X):$a"
	read a
    fi
	case "$a" in
	R|r) a=R;;
	X|x) a=n;;
	*) a=y;;
	esac
}

if test -f $simdir ; then
	rm -f $simdir # maybe mkstemp was used and the file was created.
fi

if  mkdir $simdir ; then
	true
else
	echo "Couldn't mkdir $simdir"
	read a
	exit 0
fi
	
# make a file for communication with neuron

cp $1 $simdir/nrnzip.zip
echo "Changing the current directory to $simdir"
cd $simdir

unzip -n nrnzip.zip

if [ -r mosinit.hoc ] ; then
	first=./mosinit.hoc
else
	first=`find . -name mosinit.hoc -print |sed -n 1p`
fi

if [ -z "$first" ] ; then
	echo "Missing the mosinit.hoc file"
	cleanup
fi
cd `dirname $first`
first=`basename $first`

if [ -f moslocal.tmp ] ; then
	askread="no"
fi

moddirs="`sed -n '1s;^//moddir;;p' < $first | tr -d '\r'`"
if test "$moddirs" != "" ; then
	modfiles='yes'
else
	modfiles="`ls *.mod 2>/dev/null`"
fi

if [ "$modfiles" ] ; then
	# run special
	a=y
    if test "$askread" = "yes" ; then
	echo "Create the special version and run it? (y/n):"
	read a
    fi
	if [ "$a" != "y" -a "$a" != "" ] ; then
		cleanup
	fi
	"${NRNBIN}nrnivmodl" $moddirs
	a=R
	while test "$a" = "R" ; do
		./${ARCH}/special mosinit.hoc -
		asklaunch
	done
else
	# run neuron
	a=y
    if test "$askread" = "yes" ; then
	echo "Run NEURON? (y/n):"
	read a
    fi
	if [ "$a" != "y" -a "$a" != "" ] ; then
		cleanup
	fi
	a=R
	while test "$a" = "R" ; do
		"${NRNBIN}nrniv" $first -
		asklaunch
	done
fi

doclean
