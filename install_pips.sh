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
SUDO="sudo -H";
PIP="pip install";

if [ "$CURR_OS" == "cygwin" ]; then
    SUDO="sudo";
    PIP="easy_install-2.7";
fi;

## Pip itself.
if [ "$PIP" == "pip install" ]; then
    $SUDO $PIP  --upgrade pip
fi;

## COWTODO(n2omatt): Make all the programs a list and iterate in a for loop.
##  The way that we're doing is tooo ugly!

# wget
$SUDO $PIP wget

# Gitcheck
$SUDO $PIP colored
$SUDO $PIP git+git://github.com/badele/gitcheck.git
# Git Archive
$SUDO $PIP git-archive-all

# Youtube-dl
$SUDO $PIP youtube-dl

# AmazingCow - CowTermcolor
$SUDO $PIP cowtermcolor

# Rainbomstream
$SUDO $PIP rainbowstream

# Pyinstaller
$SUDO $PIP pyinstaller

# Grip
$SUDO $PIP grip

# Statistics
$SUDO $PIP statistics

