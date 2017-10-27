#!/bin/sh
################################################################################
## File    : meslo_font.sh                                                    ##
## Author  : N2OMatt - n2o.matt@gmail.com                                     ##
## Date    : Tue Oct 11 20:39:53 2016 UTC                                     ##
## License : GPLv3                                                            ##
##                                                                            ##
##  Install the Cocos2dx 3.13                                                 ##
################################################################################


DOWNLOAD_URL="http://cdn.cocos2d-x.org/cocos2d-x-3.13.1.zip"
DOWNLOAD_PATH=$(mktemp -d)
INSTALL_PATH="/home/n2omatt/Documents/Packages/cocos2d-x-3.13.1";

## Download.
echo "Downloading...";
wget $DOWNLOAD_URL -P $DOWNLOAD_PATH;

## Uncompress
echo "Uncompressing...";
cd $DOWNLOAD_PATH
unzip -o $DOWNLOAD_PATH/cocos2d-x-3.13.1.zip


## Install
echo "Installing...";
rm -rf $INSTALL_PATH;
mkdir -p $INSTALL_PATH;

mv -f $DOWNLOAD_PATH/cocos2d-x-3.13.1/* $INSTALL_PATH

## Run the installation scripts.
cd $INSTALL_PATH
chmod 744 ./build/install-deps-linux.sh
yes | sudo ./build/install-deps-linux.sh

chmod 744 ./setup.py
./setup.py


## Link the FMOD lib to usr/local/lib
##   I don't know why cocos2dx is using fmod in linux !!??
echo "Copying / Linking FMOD..."
sudo cp -f "$PWD/external/linux-specific/fmod/prebuilt/64-bit/libfmod.so"  /usr/local/lib/libfmod.so
sudo cp -f "$PWD/external/linux-specific/fmod/prebuilt/64-bit/libfmodL.so" /usr/local/lib/libfmodL.so
sudo ln -sf /usr/local/lib/libfmod.so /usr/local/lib/libfmod.so.6
## Rebuild the cache
sudo ldconfig;


## Create an script just to call the cocos program.
## So all of our tools can just call it.
echo "#!/bin/bash" | sudo tee /usr/local/bin/cocos-console
echo "$INSTALL_PATH/tools/cocos2d-console/bin/cocos" '$@' | sudo tee --append /usr/local/bin/cocos-console
sudo chmod 755 /usr/local/bin/cocos-console


## Restore the CWD
cd -
echo "done..."
