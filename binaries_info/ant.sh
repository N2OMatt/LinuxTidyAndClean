#!/bin/sh
################################################################################
## File    : ant.sh                                                           ##
## Author  : N2OMatt - n2o.matt@gmail.com                                     ##
## Date    : Tue Oct 11 21:44:01 2016 UTC                                     ##
## License : GPLv3                                                            ##
##                                                                            ##
## Install the ANT                                                            ##
################################################################################


DOWNLOAD_URL=http://mirror.nbtelecom.com.br/apache//ant/binaries/apache-ant-1.9.7-bin.zip
DOWNLOAD_PATH=$(mktemp -d)
INSTALL_PATH="/home/n2omatt/Documents/Packages/AndroidDev";


## Download.
echo "Downloading...";
wget $DOWNLOAD_URL -P $DOWNLOAD_PATH;

## Uncompress
echo "Uncompressing...";
cd $DOWNLOAD_PATH
unzip -o apache-ant-1.9.7-bin.zip

## Install
echo "Installing...";
mkdir -p $INSTALL_PATH
mv apache-ant-1.9.7 $INSTALL_PATH/apache-ant-1.9.7

## Done
cd -
echo "Done...";
