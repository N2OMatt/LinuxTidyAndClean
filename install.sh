#!/bin/bash
##----------------------------------------------------------------------------##
## File      : install.sh                                                     ##
## Project   : LinuxTidyAndClean                                              ##
## Author    : n2omatt <n2omatt@amazingcow.com>                               ##
## Date      : 2017                                                           ##
## License   : GPLv3                                                          ##
## Copyright : N2OMatt - Copyright (c) 2017                                   ##
##                                                                            ##
## Description:                                                               ##
##   Just call all other scripts to perform the actual installation.          ##
##----------------------------------------------------------------------------##

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
