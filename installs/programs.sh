#!/bin/bash
##~---------------------------------------------------------------------------##
##                        ____                       _   _                    ##
##                  _ __ |___ \ ___  _ __ ___   __ _| |_| |_                  ##
##                 | '_ \  __) / _ \| '_ ` _ \ / _` | __| __|                 ##
##                 | | | |/ __/ (_) | | | | | | (_| | |_| |_                  ##
##                 |_| |_|_____\___/|_| |_| |_|\__,_|\__|\__|                 ##
##                              www.n2omatt.com                               ##
##  File      : programs.sh                                                   ##
##  Project   : LinuxTidyAndClean                                             ##
##  Date      : Oct 27, 2017                                                  ##
##  License   : GPLv3                                                         ##
##  Author    : n2omatt <n2omatt@amazingcow.com>                              ##
##  Copyright : n2omatt - 2017                                                ##
##                                                                            ##
##  Description :                                                             ##
##    Installs the packages provided by the Operating System vendor.          ##
##    This is just a wrapper to easy the usage of the actual install          ##
##    scripts that are required for each platform that we support.            ##
##                                                                            ##
##    Each platform install script should be located on:                      ##
##       ./packages/os-type/os-distro/install.sh                              ##
##                                                                            ##
##    This script requires that the n2omatt's simple-os-name from             ##
##    dots_utils to be already installed.                                     ##
##---------------------------------------------------------------------------~##


##----------------------------------------------------------------------------##
## Vars                                                                       ##
##----------------------------------------------------------------------------##
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)";
OLD_CWD=$(pwd);
HAS_SIMPLE_OS_NAME=$(whereis simple-os-name | cut -d":" -f2);
OS_TYPE="";
OS_DISTRO="";
INSTALL_SCRIPT_PATH="";


##----------------------------------------------------------------------------##
## Functions                                                                  ##
##----------------------------------------------------------------------------##
print_info()
{
    echo "CWD            : ($(pwd))";
    echo "OS type        : ($OS_TYPE)";
    echo "OS distro      : ($OS_DISTRO)";
    echo "Install script : ($INSTALL_SCRIPT_PATH)";
}

fatal()
{
    echo "[FATAL] $@";
}


##----------------------------------------------------------------------------##
## Script                                                                     ##
##----------------------------------------------------------------------------##
##------------------------------------------------------------------------------
## Change the CWD to the script dir.
cd "$SCRIPT_DIR";

##------------------------------------------------------------------------------
## Get the info about the system.
if [ -z "$HAS_SIMPLE_OS_NAME" ]; then
    fatal "simple-os-name isn't installed... - Aborting";
    exit 1;
fi;

OS_TYPE=$(/usr/local/bin/simple-os-name --type);
OS_DISTRO=$(/usr/local/bin/simple-os-name --distro);

##------------------------------------------------------------------------------
## Build the install script path.
INSTALL_SCRIPT_PATH="./packages/$OS_TYPE/$OS_DISTRO/install.sh";

if [ ! -f "$INSTALL_SCRIPT_PATH" ]; then
    fatal "Cannot find the install script... - Aborting";
    print_info;
    exit 1;
fi;


##------------------------------------------------------------------------------
## Call the installation script.
print_info;
$INSTALL_SCRIPT_PATH;


##------------------------------------------------------------------------------
## Go back to where we were at begining...
cd $OLD_CWD;
echo "Going back to old CWD: ($(pwd))";
