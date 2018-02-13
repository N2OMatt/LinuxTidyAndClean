#!/usr/bin/env sh

##----------------------------------------------------------------------------##
## Helper Functions                                                           ##
##----------------------------------------------------------------------------##
function pause()
{
   read -p "$*"
}


##----------------------------------------------------------------------------##
## Vars                                                                       ##
##----------------------------------------------------------------------------##
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)";
INTERACTIVE="";
PACKAGES_TO_INSTALL="";


##----------------------------------------------------------------------------##
## Script                                                                     ##
##----------------------------------------------------------------------------##
##------------------------------------------------------------------------------
## Check if we're on interactive mode.
if [ "$1" == "-i" ]; then
    INTERACTIVE="true";
fi;

##------------------------------------------------------------------------------
## Go to the script directory.
cd $SCRIPT_DIR;

##------------------------------------------------------------------------------
## Clean all the lines from file and let only the packages names.
INPUT_FILE="./packages_list.txt"
while read -r LINE; do
    ##--------------------------------------------------------------------------
    ## Skip non package lines.
    test -z "$LINE"           && continue; ## Blank lines.
    test "${LINE:0:1}" == "#" && continue; ## Commented lines.

    PACKAGES_TO_INSTALL+=" $LINE";

done < "$INPUT_FILE"


##--------------------------------------------------------------------------
## Install.
for PACKAGE in $PACKAGES_TO_INSTALL; do
    echo "Installing package: ($PACKAGE)";
    sudo zypper install -y "$PACKAGE";

    test "$INTERACTIVE" == "true" && pause "Waiting...";
done;


##------------------------------------------------------------------------------
## Go back from where we came...
cd - > /dev/null