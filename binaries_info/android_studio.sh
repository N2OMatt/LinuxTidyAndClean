#!/bin/sh
################################################################################
## File    : android_studio.sh                                                ##
## Author  : N2OMatt - n2o.matt@gmail.com                                     ##
## Date    : Tue Oct 11 21:26:37 2016 UTC                                     ##
## License : GPLv3                                                            ##
##                                                                            ##
## Install the Android Studio IDE                                             ##
################################################################################


DOWNLOAD_URL=https://dl.google.com/dl/android/studio/ide-zips/2.2.1.0/android-studio-ide-145.3330264-linux.zip
DOWNLOAD_PATH=$(mktemp -d)
INSTALL_PATH="/home/n2omatt/Documents/Packages/AndroidDev";


## Download.
echo "Downloading...";
# wget $DOWNLOAD_URL -P $DOWNLOAD_PATH;

## Uncompress
echo "Uncompressing...";
cd $DOWNLOAD_PATH
unzip -o android-studio-ide-145.3330264-linux.zip


## Install
echo "Installing...";
mkdir -p $INSTALL_PATH;
mv -f android-studio $INSTALL_PATH/android-studio;

sudo ln -s $INSTALL_PATH/android-studio/bin/studio.sh /usr/local/bin/android-studio


## Done
# cd -
echo "Done...";
