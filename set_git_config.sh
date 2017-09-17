#!/bin/bash
##----------------------------------------------------------------------------##
## File      : set_git_config.sh                                              ##
## Project   : LinuxTidyAndClean                                              ##
## Author    : n2omatt <n2omatt@amazingcow.com>                               ##
## Date      : 2017                                                           ##
## License   : GPLv3                                                          ##
## Copyright : N2OMatt - Copyright (c) 2017                                   ##
##                                                                            ##
## Description:                                                               ##
##   Initial configuration to git.                                            ##
##----------------------------------------------------------------------------##

#Setup my username and email.
git config --global user.email "mesquita@letslive.green"
git config --global user.name  "n2omatt"

#Set up the credential helper.
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600' #1hour
