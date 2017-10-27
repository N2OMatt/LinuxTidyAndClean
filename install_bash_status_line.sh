#!/bin/bash
##~---------------------------------------------------------------------------##
##                        ____                       _   _                    ##
##                  _ __ |___ \ ___  _ __ ___   __ _| |_| |_                  ##
##                 | '_ \  __) / _ \| '_ ` _ \ / _` | __| __|                 ##
##                 | | | |/ __/ (_) | | | | | | (_| | |_| |_                  ##
##                 |_| |_|_____\___/|_| |_| |_|\__,_|\__|\__|                 ##
##                              www.n2omatt.com                               ##
##  File      : install_bash_status_line.sh                                   ##
##  Project   : LinuxTidyAndClean                                             ##
##  Date      : May 27, 2017                                                  ##
##  License   : GPLv3                                                         ##
##  Author    : n2omatt <n2omatt@amazingcow.com>                              ##
##  Copyright : n2omatt - 2017                                                ##
##                                                                            ##
##  Description :                                                             ##
##                                                                            ##
##---------------------------------------------------------------------------~##


################################################################################
## Vars                                                                       ##
################################################################################
TARGET_DIR="$HOME/Documents/Projects/N2OMatt/bash-status-line";

################################################################################
## Script                                                                     ##
################################################################################
echo "--> Target directory:";
echo "    $TARGET_DIR";

## If we already have clonned the repos we can just install the program,
## otherwise we need clone them first.
if [ -d "$TARGET_DIR" ]; then
    echo "--> Already have target directory.";
    echo "    Cleanning it...";
    cd "$TARGET_DIR";

    git reset --hard master;
    git pull origin master;

## Otherwise clone it from github.
else
    ./download_all_repos.sh
fi;

## Install!
./install.sh
