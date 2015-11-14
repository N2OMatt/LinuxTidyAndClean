#!/bin/sh

DOWNLOAD_PATH=$1
PACKAGE_NAME=$2
DEST_PATH=~/Documents/Packages
PACKAGE_PATH=$DOWNLOAD_PATH/$PACKAGE_NAME.run

#COWTODO: Make this install the binary automatically....
echo "Installing QT - [$PACKAGE_NAME]"

# #Make executable
chmod 744 $PACKAGE_PATH

# #Run...
$PACKAGE_PATH
