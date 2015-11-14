#!/bin/sh

DOWNLOAD_PATH=$1
PACKAGE_NAME=$2
DEST_PATH=~/Documents/Packages
PACKAGE_PATH=$DOWNLOAD_PATH/$PACKAGE_NAME.zip

echo "Installing Cocos2dx - [$2]"

#Create the destination path if not exists
#and unzip the contents there.
echo "Unzipping...";
mkdir -p $DEST_PATH
unzip -qq -o $PACKAGE_PATH -d $DEST_PATH


#Perform the install steps for cocos2d-x

#We change the directory to the cocos2d-x dir because
#is so much easier handle the paths in this way.
cd $DEST_PATH/$PACKAGE_NAME

#Run the install deps.
echo "Running install-deps-linux.sh ..."
cd ./build
./install-deps-linux.sh

#Run the setup.
echo "Running setup.py ..."
cd ../
./setup.py

echo "done..."

