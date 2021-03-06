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
## Imports                                                                    ##
##----------------------------------------------------------------------------##
source /usr/local/src/acow_shellscript_utils.sh


##----------------------------------------------------------------------------##
## Vars                                                                       ##
##----------------------------------------------------------------------------##
REAL_HOME=$(find_real_user_home);
N2OMATT_DIR="$REAL_HOME/Documents/Projects/N2OMatt";
PROGRAMS="dots                \
          bash-status-line    \
          n2omatt-vscode-ex"


##----------------------------------------------------------------------------##
## Functions                                                                  ##
##----------------------------------------------------------------------------##
install_program()
{
    cd "$N2OMATT_DIR/$1"

    ## Check which install method we have
    ## in the repo and use it ;D
    [ -e "install.sh" ] && as_super_user ./install.sh
    [ -e "install.py" ] && as_super_user ./install.py
    [ -e "Makefile"   ] && as_super_user make install;

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
