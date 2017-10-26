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

git submodule update --init --recursive

## Install the programs that system need to run everything else.
./install_programs.sh
./install_binaries.sh
./install_pips.sh

## Setup the home folder.
./clean_home_folder.sh
./create_bashprofile.sh

## Download/Install AmazingCow stuff.
./download_all_repos.sh
./install_amazingcow_programs.sh

## Download/Install N2OMatt stuff.
./install_dots.sh
./install_bash_status_line.sh

## Configure everything else.
./set_git_config.sh
./set_sublime_config.sh
./set_monodevelop_config.sh --force         ## Install plain Monodevelop config.
./set_monodevelop_config.sh --force --unity ## Install Unity Monodevelop config.
./set_qtcreator_config.sh
./set_various_programs_config.sh
