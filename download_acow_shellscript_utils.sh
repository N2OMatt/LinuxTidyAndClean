#!/usr/bin/env sh

##----------------------------------------------------------------------------##
## Script                                                                     ##
##----------------------------------------------------------------------------##
##------------------------------------------------------------------------------
## Dummy clone... - We don't care to maintain it...
cd /var/tmp;
rm -rf acow_shellscript_utils
git clone http://github.com/AmazingCow-Libs/acow_shellscript_utils

##------------------------------------------------------------------------------
## Install...
cd /var/tmp/acow_shellscript_utils
sudo ./install.sh
