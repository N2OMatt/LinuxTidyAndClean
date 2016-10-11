#!/bin/sh
################################################################################
## File    : android_sdk.sh                                                   ##
## Author  : N2OMatt - n2o.matt@gmail.com                                     ##
## Date    : Tue Oct 11 21:26:37 2016 UTC                                     ##
## License : GPLv3                                                            ##
##                                                                            ##
## Install the Android SDK                                                    ##
################################################################################


DOWNLOAD_URL=https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
DOWNLOAD_PATH=$(mktemp -d)
INSTALL_PATH="/home/n2omatt/Documents/Packages/AndroidDev";


## Download.
echo "Downloading...";
wget $DOWNLOAD_URL -P $DOWNLOAD_PATH;

## Uncompress
echo "Uncompressing...";
cd $DOWNLOAD_PATH
tar zxvf android-sdk_r24.4.1-linux.tgz


## Install
echo "Installing...";
mkdir -p $INSTALL_PATH;
mv -f android-sdk-linux $INSTALL_PATH;


## Done
cd -
echo "Done...";
