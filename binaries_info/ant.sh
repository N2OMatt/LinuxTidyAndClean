#!/bin/sh
################################################################################
## File    : ant.sh                                                           ##
## Author  : N2OMatt - n2o.matt@gmail.com                                     ##
## Date    : Tue Oct 11 21:44:01 2016 UTC                                     ##
## License : GPLv3                                                            ##
##                                                                            ##
## Install the ANT                                                            ##
################################################################################

ANT_FILE="apache-ant-1.10.1-bin.zip"
DOWNLOAD_URL=http://mirror.nbtelecom.com.br/apache//ant/binaries/$ANT_FILE
DOWNLOAD_PATH=$(mktemp -d)
INSTALL_PATH="/home/n2omatt/Documents/Packages/AndroidDev";


## Download.
echo "Downloading...";
wget $DOWNLOAD_URL -P $DOWNLOAD_PATH;

## Uncompress
echo "Uncompressing...";
cd $DOWNLOAD_PATH
unzip -o "$ANT_FILE"

## Install
echo "Installing...";
mkdir -p $INSTALL_PATH
mv "$ANT_FILE" "$INSTALL_PATH/$ANT_FILE"

## Done
cd -
echo "Done...";
