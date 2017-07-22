#!/bin/bash
##----------------------------------------------------------------------------##
## File      : install_amazingcow_programs.sh                                 ##
## Project   : LinuxTidyAndClean                                              ##
## Author    : n2omatt <n2omatt@amazingcow.com>                               ##
## Date      : 2017                                                           ##
## License   : GPLv3                                                          ##
## Copyright : N2OMatt - Copyright (c) 2017                                   ##
##                                                                            ##
## Description:                                                               ##
##   Installs the most usefuls AmazingCow's tools.                            ##
##   To add /remove a tool just edit the PROGRAMS var.                        ##
##----------------------------------------------------------------------------##

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



