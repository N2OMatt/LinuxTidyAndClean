#!/usr/bin/env sh
##~---------------------------------------------------------------------------##
##                        ____                       _   _                    ##
##                  _ __ |___ \ ___  _ __ ___   __ _| |_| |_                  ##
##                 | '_ \  __) / _ \| '_ ` _ \ / _` | __| __|                 ##
##                 | | | |/ __/ (_) | | | | | | (_| | |_| |_                  ##
##                 |_| |_|_____\___/|_| |_| |_|\__,_|\__|\__|                 ##
##                              www.n2omatt.com                               ##
##  File      : download_all_repos.sh                                         ##
##  Project   : LinuxTidyAndClean                                             ##
##  Date      : May 27, 2017                                                  ##
##  License   : GPLv3                                                         ##
##  Author    : n2omatt <n2omatt@amazingcow.com>                              ##
##  Copyright : n2omatt - 2017                                                ##
##                                                                            ##
##  Description :                                                             ##
##    Downloads all Amazing Cow's and N2OMatt's repos.                        ##
##---------------------------------------------------------------------------~##

##------------------------------------------------------------------------------
## Vars                                                                       ##
##------------------------------------------------------------------------------
REAL_HOME=$(/usr/local/bin/user-real-home);
TARGET_DIR="$REAL_HOME/Documents/Projects/N2OMatt/DownloadRepos";
GITHUB_URL="http://github.com/N2OMatt/DownloadRepos";


##------------------------------------------------------------------------------
## Script                                                                     ##
##------------------------------------------------------------------------------
echo "--> Target directory:";
echo "    $TARGET_DIR";

##------------------------------------------------------------------------------
## We already have the repos previously cloned...
##   So maybe we just updating or clonning the missing ones.
##   Let's go to the folder and start clean.
if [ -d "$TARGET_DIR" ]; then
    echo "--> Already have target directory.";
    echo "    Cleanning it...";
    cd "$TARGET_DIR";

    git pull origin master;

##------------------------------------------------------------------------------
## Otherwise clone it from github.
else
    echo "--> Doesn't have target directory.";
    echo "    Clonning it...";
    mkdir -pv $(dirname $TARGET_DIR);

    cd $(dirname "$TARGET_DIR");
    git clone "$GITHUB_URL";

    cd "$TARGET_DIR";
fi;

##------------------------------------------------------------------------------
## Start clone stuff!
./download_all.sh
