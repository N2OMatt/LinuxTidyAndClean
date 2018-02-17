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

##----------------------------------------------------------------------------##
## Imports                                                                    ##
##----------------------------------------------------------------------------##
source /usr/local/src/acow_shellscript_utils.sh


##----------------------------------------------------------------------------##
## Vars                                                                       ##
##----------------------------------------------------------------------------##
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
      cx_Freeze                                \
      pygame                                   \
      numpy                                    \
      youtube-dl";


##----------------------------------------------------------------------------##
## Script                                                                     ##
##----------------------------------------------------------------------------##
## Install the pips.
as_super_user python  -m ensurepip --upgrade;
as_super_user python3 -m ensurepip --upgrade;


## Install each module.
for PIP in $PIPS; do
    as_super_user pip  install "$PIP";
    as_super_user pip3 install "$PIP";
done
