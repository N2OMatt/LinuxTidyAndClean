#!/bin/sh

DATE=$(date +%s)
TEMP_PATH=./binaries/$DATE
PACKAGE_PATH=$1/$2.zip

echo "Installing C++ Manual [$2]"

# #Create the destination path if not exists
# #and unzip the contents there.
echo "Unzipping..."
unzip -qq -o $PACKAGE_PATH -d $TEMP_PATH

# Run the package scripts....
echo "Running package scripts..."
cd $TEMP_PATH/$2
./configure
sudo make install
cd - 

# #Remove the temp folder.
echo "Removing temporary folder..."
# rm -rf $TEMP_PATH;

echo "done..."
