#!/bin/bash
##----------------------------------------------------------------------------##
## File      : download_all_repos.sh                                          ##
## Project   : LinuxTidyAndClean                                              ##
## Author    : n2omatt <n2omatt@amazingcow.com>                               ##
## Date      : 2017                                                           ##
## License   : GPLv3                                                          ##
## Copyright : N2OMatt - Copyright (c) 2017                                   ##
##                                                                            ##
## Description:                                                               ##
##                                                                            ##
##----------------------------------------------------------------------------##

cd ./DownloadRepos;
git pull origin master;

./download_amazingcow.py 
./download_n2omatt.py
