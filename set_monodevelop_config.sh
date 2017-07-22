#!/bin/bash
##----------------------------------------------------------------------------##
## File      : set_monodevelop_config.sh                                      ##
## Project   : LinuxTidyAndClean                                              ##
## Author    : n2omatt <n2omatt@amazingcow.com>                               ##
## Date    : Jun 10, 2017                                                     ##
## License   : GPLv3                                                          ##
## Copyright : N2OMatt - Copyright (c) 2017                                   ##
##                                                                            ##
## Description:                                                               ##
##   Install the monodevelop configuration :D                                 ##
##----------------------------------------------------------------------------##

## Update the repo to the latest revision.
cd ./monodevelop_config;
git pull origin master

## Install ;D
./install.sh
