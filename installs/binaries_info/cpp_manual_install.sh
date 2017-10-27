#!/bin/sh


DOWNLOAD_URL=https://github.com/jeaye/stdman/archive/master.zip
DST_PATH=$(mktemp -d);

echo "Downloading C++ Manual";
wget $DOWNLOAD_URL -P $DST_PATH;


echo "Unzipping..."
unzip -qq -o $DST_PATH/master.zip -d $DST_PATH

echo "Installing C++ Manual"
cd $DST_PATH/stdman-master

./configure
sudo make install
sudo mandb

echo "done..."
