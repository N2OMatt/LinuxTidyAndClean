#!/bin/bash
################################################################################
## File    : install.sh                                                       ##
## Project : LinuxTidyAndClean                                                ##
## Date    : May 22, 2017                                                     ##
## Author  : n2omatt@amazingcow.com                                           ##
## License : GPLv3                                                            ##
##                                                                            ##
## Description :                                                              ##
##   Install the sublime configuration :D                                     ##
################################################################################


## Fist initiliaze the repository since the sublime config is on submodule.
##   If the repo is already initialized, this will be a no op...
git submodule update --init --recursive

## Update the repo to the latest revision.
cd ./sublimetext3_config;
git pull origin master

## Install ;D
./install.sh
