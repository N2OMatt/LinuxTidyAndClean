#!/bin/bash

## Make the CWD the same of the script.
##   This ease the path manipulation stuff.
cd $(dirname $(readlink -f "$0"));


################################################################################
## Vars                                                                       ##
################################################################################
DST_DIR="$HOME/.config/Thunar/";
SRC_DIR="data";


################################################################################
## Script                                                                     ##
################################################################################
mkdir -p "$DST_DIR";
cp -rv "$SRC_DIR"/* $DST_DIR;