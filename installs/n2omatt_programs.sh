#!/bin/bash
##~---------------------------------------------------------------------------##
##                        ____                       _   _                    ##
##                  _ __ |___ \ ___  _ __ ___   __ _| |_| |_                  ##
##                 | '_ \  __) / _ \| '_ ` _ \ / _` | __| __|                 ##
##                 | | | |/ __/ (_) | | | | | | (_| | |_| |_                  ##
##                 |_| |_|_____\___/|_| |_| |_|\__,_|\__|\__|                 ##
##                              www.n2omatt.com                               ##
##  File      : install_amazingcow_programs.sh                                ##
##  Project   : LinuxTidyAndClean                                             ##
##  Date      : May 28, 2017                                                  ##
##  License   : GPLv3                                                         ##
##  Author    : n2omatt <n2omatt@amazingcow.com>                              ##
##  Copyright : n2omatt - 2017                                                ##
##                                                                            ##
##  Description :                                                             ##
##    Installs the most usefuls AmazingCow's tools.                           ##
##    To add /remove a tool just edit the PROGRAMS var.                       ##
##---------------------------------------------------------------------------~##

################################################################################
## Vars                                                                       ##
################################################################################
N2OMATT_DIR="$HOME/Documents/Projects/N2OMatt";
PROGRAMS="bash-status-line \
          dots             \
          sublimetext3_config";

################################################################################
## Script                                                                     ##
################################################################################
install_program()
{
    echo "----> Installing $1...";
    cd "$N2OMATT_DIR/$1"

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



