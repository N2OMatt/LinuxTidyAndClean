#!/bin/sh
################################################################################
## File    : qt_creator.sh                                                    ##
## Author  : N2OMatt - n2o.matt@gmail.com                                     ##
## Date    : Tue Oct 11 21:15:05 2016 UTC                                     ##
## License : GPLv3                                                            ##
##                                                                            ##
##  Install the QTCreator                                                     ##
################################################################################

DOWNLOAD_URL=http://download.qt.io/official_releases/qtcreator/4.1/4.1.0/qt-creator-opensource-linux-x86_64-4.1.0.run
DOWNLOAD_PATH=$(mktemp -d);

## Download
echo "Downloading...";
wget $DOWNLOAD_URL -P $DOWNLOAD_PATH;

## Install
echo "Insalling..."
chmod 744 $DOWNLOAD_PATH/qt-creator-opensource-linux-x86_64-4.1.0.run
$DOWNLOAD_PATH/qt-creator-opensource-linux-x86_64-4.1.0.run

## :D
echo "done..."
