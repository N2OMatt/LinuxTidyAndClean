#!/bin/sh
################################################################################
## File    : android_ndk.sh                                                   ##
## Author  : N2OMatt - n2o.matt@gmail.com                                     ##
## Date    : Tue Oct 11 21:26:37 2016 UTC                                     ##
## License : GPLv3                                                            ##
##                                                                            ##
## Install the Android NDK                                                    ##
################################################################################


################################################################################
## Variables                                                                  ##
################################################################################
NDK_VERSION="android-ndk-r13";
DOWNLOAD_URL=https://dl.google.com/android/repository/$NDK_VERSION-linux-x86_64.zip
DOWNLOAD_PATH=$(mktemp -d)
INSTALL_PATH="/home/n2omatt/Documents/Packages/AndroidDev";

################################################################################
## Download                                                                   ##
################################################################################
echo "Downloading...";
wget $DOWNLOAD_URL -P $DOWNLOAD_PATH;

################################################################################
## Uncompress                                                                 ##
################################################################################
echo "Uncompressing...";
cd $DOWNLOAD_PATH;
unzip $DOWNLOAD_PATH/$NDK_VERSION-linux-x86_64.zip

################################################################################
## Install                                                                    ##
################################################################################
echo "Installing...";
mkdir -p $INSTALL_PATH;
mv -f $DOWNLOAD_PATH/$NDK_VERSION $INSTALL_PATH/$NDK_VERSION;

################################################################################
## Update .bashrc                                                             ##
################################################################################
FOUND=$(cat ~/.bashrc | grep "NDK_ROOT=$INSTALL_PATH/$NDK_VERSION");
if [ -n "$FOUND" ]; then
    echo "Found: " $FOUND
else
    echo "######################################################################" >> ~/.bashrc;
    echo "## NDK ROOT                                                         ##" >> ~/.bashrc;
    echo "######################################################################" >> ~/.bashrc;
    echo "export NDK_ROOT=$INSTALL_PATH/$NDK_VERSION"                             >> ~/.bashrc;
    echo 'export PATH=$NDK_ROOT:$PATH'                                            >> ~/.bashrc;
fi;
