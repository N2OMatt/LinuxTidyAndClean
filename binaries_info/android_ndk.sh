#!/bin/sh
################################################################################
## File    : android_ndk.sh                                                   ##
## Author  : N2OMatt - n2o.matt@gmail.com                                     ##
## Date    : Tue Oct 11 21:26:37 2016 UTC                                     ##
## License : GPLv3                                                            ##
##                                                                            ##
## Install the Android NDK                                                    ##
################################################################################


DOWNLOAD_URL=https://dl.google.com/android/repository/android-ndk-r13-linux-x86_64.zip
DOWNLOAD_PATH=$(mktemp -d)
INSTALL_PATH="/home/n2omatt/Documents/Packages/AndroidDev";


## Download.
echo "Downloading...";
wget $DOWNLOAD_URL -P $DOWNLOAD_PATH;

## Uncompress
echo "Uncompressing...";
cd $DOWNLOAD_PATH;
unzip $DOWNLOAD_PATH/android-ndk-r13-linux-x86_64.zip


## Install
echo "Installing...";
mkdir -p $INSTALL_PATH;
mv -f $DOWNLOAD_PATH/android-ndk-r13 $INSTALL_PATH/android-ndk-r13;


## Done
cd -
echo "Done...";
