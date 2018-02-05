#!/usr/bin/env sh
##~---------------------------------------------------------------------------##
##                        ____                       _   _                    ##
##                  _ __ |___ \ ___  _ __ ___   __ _| |_| |_                  ##
##                 | '_ \  __) / _ \| '_ ` _ \ / _` | __| __|                 ##
##                 | | | |/ __/ (_) | | | | | | (_| | |_| |_                  ##
##                 |_| |_|_____\___/|_| |_| |_|\__,_|\__|\__|                 ##
##                              www.n2omatt.com                               ##
##  File      : install_workstation.sh                                        ##
##  Project   : LinuxTidyAndClean                                             ##
##  Date      : Oct 26, 2017                                                  ##
##  License   : GPLv3                                                         ##
##  Author    : n2omatt <n2omatt@amazingcow.com>                              ##
##  Copyright : n2omatt - 2017                                                ##
##                                                                            ##
##  Description :                                                             ##
##    Install stuff that is need for a workstation.                           ##
##---------------------------------------------------------------------------~##

##----------------------------------------------------------------------------##
## Scripts                                                                    ##
##----------------------------------------------------------------------------##
##------------------------------------------------------------------------------
## This is the first thing that we need to do since a lot of our scripts
## depends on its features to work correctly...
./download_dots_utils.sh

##------------------------------------------------------------------------------
## We need download the repos...
./download_all_repos.sh

##------------------------------------------------------------------------------
## Install the OS packages.
./installs/programs.sh

##------------------------------------------------------------------------------
## Install the python pips.
./installs/pips.sh

##------------------------------------------------------------------------------
## Amazing Cow and N2OMatt Programs.
./installs/amazingcow_programs.sh
./installs/n2omatt_programs.sh

##------------------------------------------------------------------------------
## Configurations that doesn't depends on the system.
./configs/clean_home_folder.sh
./configs/create_bashprofile.sh
./configs/set_git_config.sh


##------------------------------------------------------------------------------
## Correct the ownership.
##   This is needed because some systems doesn't preserve the user stuff
##   with sudo, and if this script was called with sude all files will belong
##   to it.
if [ $UID == 0 ]; then
    REAL_HOME=$(user-real-home);
    USER=$(id -nu n2omatt);
    GROUP=$(id -ng n2omatt);

    echo "--> Fixing the owernership to ($USER.$GROUP)";
    sudo chown -R $USER.$GROUP "$REAL_HOME";
fi;
