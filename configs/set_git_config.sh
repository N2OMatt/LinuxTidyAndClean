#!/usr/bin/env bash
##~---------------------------------------------------------------------------##
##                        ____                       _   _                    ##
##                  _ __ |___ \ ___  _ __ ___   __ _| |_| |_                  ##
##                 | '_ \  __) / _ \| '_ ` _ \ / _` | __| __|                 ##
##                 | | | |/ __/ (_) | | | | | | (_| | |_| |_                  ##
##                 |_| |_|_____\___/|_| |_| |_|\__,_|\__|\__|                 ##
##                              www.n2omatt.com                               ##
##  File      : set_git_config.sh                                             ##
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
## Script                                                                     ##
################################################################################
#Setup my username and email.
git config --global user.email "n2omatt@amazingcow.com"
git config --global user.name  "n2omatt"

#Set up the credential helper.
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600' #1hour
## Other stuff...
git config --global core.autocrlf input
git config --global core.fileMode false
