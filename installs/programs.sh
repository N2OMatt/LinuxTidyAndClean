#!/bin/bash
##----------------------------------------------------------------------------##
## File      : install_programs.sh                                            ##
## Project   : LinuxTidyAndClean                                              ##
## Author    : n2omatt <n2omatt@amazingcow.com>                               ##
## Date      : 2017                                                           ##
## License   : GPLv3                                                          ##
## Copyright : N2OMatt - Copyright (c) 2017                                   ##
##                                                                            ##
## Description:                                                               ##
##                                                                            ##
##----------------------------------------------------------------------------##

## COWNOTE(n2omatt): This script just works for GNU/Linux since 
##    it'll install a lot of stuff from apt-get.
##    Actually it only works for Debian based OSes.
CURR_OS=$(uname -o | tr "[:upper:]" "[:lower:]" | tr  "/" "_");
if [ "$CURR_OS" != "gnu_linux" ]; then
    echo "[$0] OS ($CURR_OS) isn't GNU/Linux - Aborting...";
    exit 0;
fi;

./install_programs/pre_run.sh

#Add the ppas and install everything inside the install_base.
./install_programs/main.py --purge=./install_programs/list_programs/purge.txt
./install_programs/main.py --ppa=./install_programs/list_programs/ppa.txt
./install_programs/main.py --install=./install_programs/list_programs/install.txt

./install_programs/post_run.sh
