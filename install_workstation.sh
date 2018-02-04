#!/bin/bash
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
## First we need download the repos...
./download_all_repos.sh


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