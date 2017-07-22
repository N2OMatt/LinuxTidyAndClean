#!/bin/bash
##----------------------------------------------------------------------------##
## File      : install_pips.sh                                                ##
## Project   : LinuxTidyAndClean                                              ##
## Author    : n2omatt <n2omatt@amazingcow.com>                               ##
## Date      : 2017                                                           ##
## License   : GPLv3                                                          ##
## Copyright : N2OMatt - Copyright (c) 2017                                   ##
##                                                                            ##
## Description:                                                               ##
##                                                                            ##
##----------------------------------------------------------------------------##

## COWNOTE(n2omatt): I'm setting it just for GNU/Linux for now, 
##    but it probably works well for OSX too, but I'm not 
##    willing to test it on Amanda right now....     
CURR_OS=$(uname -o | tr "[:upper:]" "[:lower:]" | tr  "/" "_");
if [ "$CURR_OS" != "gnu_linux" ]; then
    echo "[$0] OS ($CURR_OS) isn't gnu_linux - Aborting...";
    exit 0;
fi;

## Pip itself.
sudo -H pip install --upgrade pip

# wget
sudo -H pip install wget

# Gitcheck
sudo -H pip install colored
sudo -H pip install git+git://github.com/badele/gitcheck.git
# Git Archive
sudo -H pip install git-archive-all

# Youtube-dl
sudo -H  pip install youtube-dl

# AmazingCow - CowTermcolor
sudo -H pip install cowtermcolor

# Rainbomstream
sudo -H pip install rainbowstream

# Pyinstaller
sudo -H pip install pyinstaller

# Grip
sudo -H pip install grip

# Statistics
sudo -H pip install statistics

