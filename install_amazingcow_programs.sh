#!/bin/bash

AMAZINGCOW_DIR="$HOME/Documents/Projects/AmazingCow/AmazingCow-Tools/";
PROGRAMS="Gosh                   \
          COWTODO                \
          Linux_USBBootCreator   \
          GuardChecker           \
          License_Header_Checker"

install_program()
{
    echo "----> Installing $1...";
    cd "$AMAZINGCOW_DIR/$1"

    ## Check which install method we have
    ## in the repo and use it ;D
    [ -e "install.sh" ] && sudo ./install.sh
    [ -e "install.py" ] && sudo ./install.py
    [ -e "Makefile"   ] && sudo make install;
}


echo "--> Installing Amazing Cow programs...";

for PROGRAM in $PROGRAMS; do
    install_program $PROGRAM;
done;

echo "Done...";



