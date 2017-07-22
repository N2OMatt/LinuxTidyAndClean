#!/bin/bash
##----------------------------------------------------------------------------##
## File      : create_bashprofile.sh                                          ##
## Project   : LinuxTidyAndClean                                              ##
## Author    : n2omatt <n2omatt@amazingcow.com>                               ##
## Date      : 2017                                                           ##
## License   : GPLv3                                                          ##
## Copyright : N2OMatt - Copyright (c) 2017                                   ##
##                                                                            ##
## Description:                                                               ##
##                                                                            ##
##----------------------------------------------------------------------------##

echo "--> Creating bash_profile...";

echo "if [ -e ~/.bashrc ]; then " >  ~/.bash_profile;
echo "   source ~/.bashrc"        >> ~/.bash_profile;
echo "fi"                         >> ~/.bash_profile;

echo "--> Done...";
