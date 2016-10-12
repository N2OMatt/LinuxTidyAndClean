#!/bin/sh
################################################################################
## File    : meslo_font.sh                                                    ##
## Author  : N2OMatt - n2o.matt@gmail.com                                     ##
## Date    : Tue Oct 11 20:39:53 2016 UTC                                     ##
## License : GPLv3                                                            ##
##                                                                            ##
##  Install the Cocos2dx 3.13                                                 ##
################################################################################


DOWNLOAD_URL=http://cdn.cocos2d-x.org/cocos2d-x-3.13.1.zip
DOWNLOAD_PATH="/home/n2omatt/Desktop"
INSTALL_PATH="/home/n2omatt/Documents/Packages/cocos2d-x-3.13.1";

## Download.
echo "Downloading...";
# wget $DOWNLOAD_URL -P $DST_PATH;


## Uncompress
echo "Uncompressing...";
cd $DOWNLOAD_PATH
unzip -o $DOWNLOAD_PATH/cocos2d-x-3.13.1.zip


## Install
echo "Installing...";
rm -rf $INSTALL_PATH;
mkdir -p $INSTALL_PATH;

mv -f $DOWNLOAD_PATH/cocos2d-x-3.13.1/* $INSTALL_PATH

cd $INSTALL_PATH
chmod 744 ./build/install-deps-linux.sh
sudo ./build/install-deps-linux.sh

chmod 744 ./setup.py
./setup.py


## Restore the CWD
cd -
echo "done..."
