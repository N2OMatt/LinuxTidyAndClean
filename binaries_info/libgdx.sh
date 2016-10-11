#!/bin/sh
################################################################################
## File    : libgdx.sh                                                        ##
## Author  : N2OMatt - n2o.matt@gmail.com                                     ##
## Date    : Tue Oct 11 21:50:59 2016 UTC                                     ##
## License : GPLv3                                                            ##
##                                                                            ##
## Install the LibGDX                                                         ##
################################################################################

DOWNLOAD_URL=http://libgdx.badlogicgames.com/nightlies/dist/gdx-setup.jar
DOWNLOAD_PATH=$(mktemp -d);
INSTALL_PATH="/home/n2omatt/Documents/Packages/AndroidDev";

## Download
echo "Downloading...";
wget $DOWNLOAD_URL -P $DOWNLOAD_PATH;

## Install
echo "Installing..."
chmod 744 $DOWNLOAD_PATH/gdx-setup.jar
mv $DOWNLOAD_PATH/gdx-setup.jar $INSTALL_PATH/gdx-setup.jar

## :D
echo "done..."
