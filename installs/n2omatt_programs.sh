#!/usr/bin/env sh
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

##----------------------------------------------------------------------------##
## Vars                                                                       ##
##----------------------------------------------------------------------------##
REAL_HOME=$(/usr/local/bin/user-real-home);
N2OMATT_DIR="$REAL_HOME/Documents/Projects/N2OMatt";
PROGRAMS="bash-status-line    \
          dots                \
          dots_utils          \
          n2omatt-vscode-ex"


##----------------------------------------------------------------------------##
## Functions                                                                  ##
##----------------------------------------------------------------------------##
install_program()
{
    echo "----> Installing $1...";
    cd "$N2OMATT_DIR/$1"

    ## Check which install method we have
    ## in the repo and use it ;D
    [ -e "install.sh" ] && sudo ./install.sh
    [ -e "install.py" ] && sudo ./install.py
    [ -e "Makefile"   ] && sudo make install;

    cd - > /dev/null
}


##----------------------------------------------------------------------------##
## Script                                                                     ##
##----------------------------------------------------------------------------##
echo "--> Installing N2OMatt programs...";

for PROGRAM in $PROGRAMS; do
    install_program $PROGRAM;
done;

echo "Done...";
