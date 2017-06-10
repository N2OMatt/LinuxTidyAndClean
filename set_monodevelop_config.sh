#!/bin/bash
################################################################################
## File    : set_monodevelop_config.sh                                        ##
## Project : LinuxTidyAndClean                                                ##
## Date    : Jun 10, 2017                                                     ##
## Author  : n2omatt@amazingcow.com                                           ##
## License : GPLv3                                                            ##
##                                                                            ##
## Description :                                                              ##
##   Install the monodevelop configuration :D                                 ##
################################################################################


## Update the repo to the latest revision.
cd ./monodevelop_config;
git pull origin master

## Install ;D
./install.sh
