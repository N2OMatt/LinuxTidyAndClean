#!/bin/bash
##----------------------------------------------------------------------------##
## File      : set_sublime_config.sh                                          ##
## Project   : LinuxTidyAndClean                                              ##
## Author    : n2omatt <n2omatt@amazingcow.com>                               ##
## Date      : May 22, 2017                                                   ##
## License   : GPLv3                                                          ##
## Copyright : N2OMatt - Copyright (c) 2017                                   ##
##                                                                            ##
## Description:                                                               ##
##                                                                            ##
##----------------------------------------------------------------------------##

## Update the repo to the latest revision.
cd ./sublimetext3_config;
git pull origin master

## Install ;D
./install.sh
