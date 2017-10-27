#!/bin/sh
################################################################################
## File    : ant.sh                                                           ##
## Author  : N2OMatt - n2o.matt@gmail.com                                     ##
## Date    : Tue Oct 11 21:44:01 2016 UTC                                     ##
## License : GPLv3                                                            ##
##                                                                            ##
## Install the ANT                                                            ##
################################################################################

################################################################################
## Variables                                                                  ##
################################################################################
ANT_FILE="apache-ant-1.10.1-bin.zip"
DOWNLOAD_URL=http://mirror.nbtelecom.com.br/apache/ant/binaries/$ANT_FILE
DOWNLOAD_PATH=$(mktemp -d)
INSTALL_PATH="/home/n2omatt/Documents/Packages/AndroidDev";


################################################################################
## Download                                                                   ##
################################################################################
echo "Downloading...";
wget $DOWNLOAD_URL -P $DOWNLOAD_PATH;


################################################################################
## Install                                                                    ##
################################################################################
echo "Install...";
cd $DOWNLOAD_PATH;
unzip -o "$ANT_FILE" -d "$INSTALL_PATH";

_ANT_ROOT=$(find $INSTALL_PATH -maxdepth 1 -iname "*ant*" -type d );


################################################################################
## Update .bashrc                                                             ##
################################################################################
FOUND=$(cat ~/.bashrc | grep "ANT_ROOT=${_ANT_ROOT}");
if [ -n "$FOUND" ]; then
    echo "Found: " $FOUND
else
    echo "######################################################################" >> ~/.bashrc;
    echo "## ANT_ROOT                                                         ##" >> ~/.bashrc;
    echo "######################################################################" >> ~/.bashrc;
    echo "export ANT_ROOT=${_ANT_ROOT}"                                           >> ~/.bashrc;
    echo 'export PATH=$ANT_ROOT/bin:$PATH'                                        >> ~/.bashrc;
fi;
