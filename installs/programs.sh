#!/bin/bash
##~---------------------------------------------------------------------------##
##                        ____                       _   _                    ##
##                  _ __ |___ \ ___  _ __ ___   __ _| |_| |_                  ##
##                 | '_ \  __) / _ \| '_ ` _ \ / _` | __| __|                 ##
##                 | | | |/ __/ (_) | | | | | | (_| | |_| |_                  ##
##                 |_| |_|_____\___/|_| |_| |_|\__,_|\__|\__|                 ##
##                              www.n2omatt.com                               ##
##  File      : programs.sh                                                   ##
##  Project   : LinuxTidyAndClean                                             ##
##  Date      : Oct 27, 2017                                                  ##
##  License   : GPLv3                                                         ##
##  Author    : n2omatt <n2omatt@amazingcow.com>                              ##
##  Copyright : n2omatt - 2017                                                ##
##                                                                            ##
##  Description :                                                             ##
##---------------------------------------------------------------------------~##

################################################################################
## Vars                                                                       ##
################################################################################
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)";
CURR_OS=$(uname -o | tr "[:upper:]" "[:lower:]" | tr  "/" "_");


################################################################################
## Script                                                                     ##
################################################################################
## COWNOTE(n2omatt): This script just works for GNU/Linux since
##    it'll install a lot of stuff from apt-get.
##    Actually it only works for Debian based OSes.
if [ "$CURR_OS" != "gnu_linux" ]; then
    echo "[$0] OS ($CURR_OS) isn't GNU/Linux - Aborting...";
    exit 0;
fi;

## The paths are relative to the script directory
cd $SCRIPT_DIR;

./programs_info/pre_run.sh

./programs_info/main.py --purge=./programs_info/list_programs/purge.txt
./programs_info/main.py --ppa=./programs_info/list_programs/ppa.txt
./programs_info/main.py --install=./programs_info/list_programs/install.txt

./programs_info/post_run.sh

## Restore the cwd.
cd -;
