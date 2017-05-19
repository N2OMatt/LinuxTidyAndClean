#!/bin/sh
################################################################################
## File    : android_sdk.sh                                                   ##
## Author  : N2OMatt - n2o.matt@gmail.com                                     ##
## Date    : Tue Oct 11 21:26:37 2016 UTC                                     ##
## License : GPLv3                                                            ##
##                                                                            ##
## Install the Android SDK                                                    ##
################################################################################


################################################################################
## Variables                                                                  ##
################################################################################
DOWNLOAD_URL=https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
DOWNLOAD_PATH=$(mktemp -d)
INSTALL_PATH="/home/n2omatt/Documents/Packages/AndroidDev";

################################################################################
## Download                                                                   ##
################################################################################
echo "Downloading...";
wget $DOWNLOAD_URL -P $DOWNLOAD_PATH;

################################################################################
## Uncompresss                                                                ##
################################################################################
echo "Uncompressing...";
cd $DOWNLOAD_PATH
tar zxvf android-sdk_r24.4.1-linux.tgz

################################################################################
## Install                                                                    ##
################################################################################
echo "Installing...";
mkdir -p $INSTALL_PATH;
mv -f android-sdk-linux $INSTALL_PATH;

################################################################################
## Update .bashrc                                                             ##
################################################################################
FOUND=$(cat ~/.bashrc | grep "ANDROID_SDK_ROOT=$INSTALL_PATH/android-sdk-linux");
if [ -n "$FOUND" ]; then
    echo "Found: " $FOUND
else
    echo "######################################################################"     >> ~/.bashrc;
    echo "## ANDROID SDK ROOT                                                 ##"     >> ~/.bashrc;
    echo "######################################################################"     >> ~/.bashrc;
    echo "export ANDROID_SDK_ROOT=$INSTALL_PATH/android-sdk-linux"                    >> ~/.bashrc;
    echo 'export PATH=$ANDROID_SDK_ROOT:$PATH'                                        >> ~/.bashrc;
    echo 'export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH' >> ~/.bashrc;
fi;
