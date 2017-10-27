#!/bin/sh
################################################################################
## File    : meslo_font.sh                                                    ##
## Author  : N2OMatt - n2o.matt@gmail.com                                     ##
## Date    : Tue Oct 11 20:20:00 2016 UTC                                     ##
## License : GPLv3                                                            ##
##                                                                            ##
##  Install the Meslo Font in ~/.fonts                                        ##
##  We are relying in the internal tar.gz / zip folder structure.             ##
################################################################################

DOWNLOAD_URL=https://github.com/andreberg/Meslo-Font/archive/v1.2.1.tar.gz
DOWNLOAD_PATH=$(mktemp -d);
INSTALL_PATHS="$HOME/.fonts /usr/share/fonts ";

echo "DOWNLOAD_PATH : $DOWNLOAD_PATH";
echo "INSTALL_PATHS  : $INSTALL_PATHS";

## Download
echo "Downloading...";
wget $DOWNLOAD_URL -P $DOWNLOAD_PATH;


## Uncompress
echo "Uncompressing..."
## The font package came with subdirectories
## named after each version.
## So we need go to the download dir and unzip the font
## just to copy the contents of this subfolder to the install path.
tar zxvf $DOWNLOAD_PATH/v1.2.1.tar.gz -C $DOWNLOAD_PATH

cd $DOWNLOAD_PATH/Meslo-Font-1.2.1/dist/v1.2.1
unzip -o "Meslo LG DZ v1.2.1.zip"

## Install
echo "Installing..."
for INSTALL_PATH in $INSTALL_PATHS; do
    mkdir -p $INSTALL_PATH;
    cp  "Meslo LG DZ v1.2.1"/*.ttf $INSTALL_PATH
done;

fc-cache -f -v ##Update the cache.


## Restore the CWD.
cd -
echo "done..."
