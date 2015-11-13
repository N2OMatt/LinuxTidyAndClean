#!/bin/sh

DATE=$(date +%s)
FILES_PATH=./binaries/$DATE
DEST_PATH=~/.fonts/

echo "Installing fonts [$1]..."

mkdir -p $DEST_PATH            #Create the destionation path if not exists...
unzip -qq -o $1 -d $FILES_PATH #Unzip onto temp folder.

#Copy the otf fonts...
find $FILES_PATH -iname  *.otf -exec cp {} $DEST_PATH \;

#Remove the temp folder.
rm -rf $FILES_PATH;

#Rebuild the cache.
fc-cache -f -v

echo "done..."
