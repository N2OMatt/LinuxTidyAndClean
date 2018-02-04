#!/usr/bin/env sh
##~---------------------------------------------------------------------------##
##                        ____                       _   _                    ##
##                  _ __ |___ \ ___  _ __ ___   __ _| |_| |_                  ##
##                 | '_ \  __) / _ \| '_ ` _ \ / _` | __| __|                 ##
##                 | | | |/ __/ (_) | | | | | | (_| | |_| |_                  ##
##                 |_| |_|_____\___/|_| |_| |_|\__,_|\__|\__|                 ##
##                              www.n2omatt.com                               ##
##  File      : pips.sh                                                       ##
##  Project   : LinuxTidyAndClean                                             ##
##  Date      : Oct 27, 2017                                                  ##
##  License   : GPLv3                                                         ##
##  Author    : n2omatt <n2omatt@amazingcow.com>                              ##
##  Copyright : n2omatt - 2017                                                ##
##                                                                            ##
##  Description :                                                             ##
##                                                                            ##
##---------------------------------------------------------------------------~##

################################################################################
## Vars                                                                       ##
################################################################################
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)";
CURR_OS=$(uname -o | tr "[:upper:]" "[:lower:]" | tr  "/" "_");

PIPS="beautifulsoup4                           \
      colored                                  \
      cowtermcolor                             \
      Flask                                    \
      git+git://github.com/badele/gitcheck.git \
      git-archive-all                          \
      GitPython                                \
      grip                                     \
      lxml                                     \
      mongoengine                              \
      pyinstaller                              \
      pymongo                                  \
      pyvirtualdisplay                         \
      rainbowstream                            \
      selenium                                 \
      statistics                               \
      wget                                     \
      youtube-dl";


pip install
################################################################################
## Script                                                                     ##
################################################################################
for PIP in $PIPS; do
    sudo -H pip  install "$PIP";
    sudo -H pip3 install "$PIP";
done
