#!/bin/sh

DATE=$(date +%s)
TEMP_PATH=./binaries/$DATE
DEST_PATH=~/.fonts/
PACKAGE_PATH=$1/$2.zip

echo "Installing fonts [$2]"

#Create the destination path if not exists
#and unzip the contents there.
echo "Unzipping..."
mkdir -p $DEST_PATH
unzip -qq -o $PACKAGE_PATH -d $TEMP_PATH

#Copy the otf fonts...
echo "Copying fonts..."
find $TEMP_PATH -iname  *.otf -exec cp {} $DEST_PATH \;

#Remove the temp folder.
echo "Removing temporary folder..."
rm -rf $TEMP_PATH;

#Rebuild the cache.
fc-cache -f -v

echo "done..."
