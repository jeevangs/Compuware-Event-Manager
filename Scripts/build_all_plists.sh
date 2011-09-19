#!/bin/bash
#
# build_all_plists is a script to auto generate the entire static data set from
# a set of csv files using a set of python scripts
#
# python-script.py inputfile
#
# author: Alex Popadich
#
# Copyright (C) Compuware Corporation 2011
#


# Inputs and output paths. These must exist at this relative location for now
SCRIPT="../../magic-scripts/PlistTools"
SOURCE="../../magic-scripts/RawData"
DEST="../CompuwareEventManager/plist_Files"

# check for destination existance otherwise bail
[ ! -d $DEST ] || [ ! -d $SCRIPT ] && exit 1

# set us up the commands
CREATEHASH="$SCRIPT/create_hashed.py"
CREATEHASHO="$SCRIPT/create_hashed.py -o /tmp/profiles_hashed.csv"
CREATEPLIST="$SCRIPT/parse_csv_to_plist.py"

# Profiles
if [ -f "$SOURCE/profiles.csv" ]; then
#$CREATEHASH "$SOURCE/profiles.csv"
#$CREATEPLIST "$SOURCE/profiles.csv" > $DEST/yessiree.csv
[ ! -f /tmp/profiles_hashed.csv ] && touch /tmp/profiles_hashed.csv || /bin/rm /tmp/profiles_hashed.csv
$CREATEHASHO "$SOURCE/profiles.csv"
$CREATEPLIST "/tmp/profiles_hashed.csv" > $DEST/attendees.plist
	if [ "$?" -ne 0 ]; then
	echo “profiles parsing failed”;
	exit 1;
	fi
fi

# Home List
if [ -f "$SOURCE/home.csv" ]; then
$CREATEPLIST "$SOURCE/home.csv" > $DEST/home.plist
	if [ "$?" -ne 0 ]; then
	echo “home parsing failed”;
	exit 1;
	fi
fi
# About Executive Council Message
if [ -f "$SOURCE/about_cec.csv" ]; then
$CREATEPLIST "$SOURCE/about_cec.csv" > $DEST/aboutcec.plist
	if [ "$?" -ne 0 ]; then
	echo “about-cec parsing failed”;
	exit 1;
	fi
fi

# About MCoE Message
if [ -f "$SOURCE/about_mcoe.csv" ]; then
$CREATEPLIST "$SOURCE/about_mcoe.csv" > $DEST/aboutmcoe.plist
	if [ "$?" -ne 0 ]; then
	echo “about-mcoe parsing failed”;
	exit 1;
	fi
fi

# About Compuware Apps
if [ -f "$SOURCE/about_apps.csv" ]; then
$CREATEPLIST "$SOURCE/about_apps.csv" > $DEST/aboutapps.plist
	if [ "$?" -ne 0 ]; then
	echo “about_apps parsing failed”;
	exit 1;
	fi
fi

# Agenda List
if [ -f "$SOURCE/agenda.csv" ]; then
$CREATEPLIST "$SOURCE/agenda.csv" > $DEST/agenda.plist
	if [ "$?" -ne 0 ]; then
	echo “agenda parsing failed”;
	exit 1;
	fi
fi


exit 0