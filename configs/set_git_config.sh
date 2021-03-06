#!/usr/bin/env sh
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
##---------------------------------------------------------------------------~##

##----------------------------------------------------------------------------##
## Script                                                                     ##
##----------------------------------------------------------------------------##
AS_N2OMATT="sudo -u n2omatt";

## Setup my username and email.
$AS_N2OMATT git config --global user.email "n2omatt@amazingcow.com"
$AS_N2OMATT git config --global user.name  "n2omatt"

## Set up the credential helper.
$AS_N2OMATT git config --global credential.helper cache
$AS_N2OMATT git config --global credential.helper 'cache --timeout=86400' ## 24 hours

## Other stuff...
$AS_N2OMATT git config --global core.autocrlf input
$AS_N2OMATT git config --global core.fileMode false
