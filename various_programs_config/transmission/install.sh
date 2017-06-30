#!/bin/bash

## Make the CWD the same of the script.
##   This ease the path manipulation stuff.
cd $(dirname $(readlink -f "$0"));


################################################################################
## Vars                                                                       ##
################################################################################
DST_DIR="$HOME/.config/transmission";
SRC_DIR="data";


################################################################################
## Script                                                                     ##
################################################################################
mkdir -p "$DST_DIR";
cat $SRC_DIR/settings.template | sed s#_HOME_#"$HOME"#g > $DST_DIR/settings.json
