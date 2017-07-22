#!/bin/bash
##----------------------------------------------------------------------------##
## File      : clean_home_folder.sh                                           ##
## Project   : LinuxTidyAndClean                                              ##
## Author    : n2omatt <n2omatt@amazingcow.com>                               ##
## Date      : 2017                                                           ##
## License   : GPLv3                                                          ##
## Copyright : N2OMatt - Copyright (c) 2017                                   ##
##                                                                            ##
## Description:                                                               ##
##                                                                            ##
##----------------------------------------------------------------------------##

cd $HOME;

echo "--> Clean Home Folder...";

## Clean useless directories.
rm -rfv Public
rm -rfv Templates

## Create the directory for torrents
mkdir -pv ./Downloads/_torrent_complete
mkdir -pv ./Downloads/_torrent_download

echo "--> Done...";
