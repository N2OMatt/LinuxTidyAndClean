#!/usr/bin/env sh
##~---------------------------------------------------------------------------##
##                        ____                       _   _                    ##
##                  _ __ |___ \ ___  _ __ ___   __ _| |_| |_                  ##
##                 | '_ \  __) / _ \| '_ ` _ \ / _` | __| __|                 ##
##                 | | | |/ __/ (_) | | | | | | (_| | |_| |_                  ##
##                 |_| |_|_____\___/|_| |_| |_|\__,_|\__|\__|                 ##
##                              www.n2omatt.com                               ##
##  File      : create_bashprofile.sh                                         ##
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
echo "--> Creating bash_profile...";

echo "if [ -e ~/.bashrc ]; then " >  "$HOME/.bash_profile";
echo "   source ~/.bashrc"        >> "$HOME/.bash_profile";
echo "fi"                         >> "$HOME/.bash_profile";

echo "--> Done...";
