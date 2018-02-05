#!/usr/bin/env sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)";
cd $SCRIPT_DIR;

input="./packages_list.txt"
while read -r var; do
    ##--------------------------------------------------------------------------
    ## Skip non package lines.
    test -z "$var"           && continue; ## Blank lines.
    test "${var:0:1}" == "#" && continue; ## Commented lines.

    ##--------------------------------------------------------------------------
    ## Install.
    sudo zypper install -y "$var"

done < "$input"

cd - > /dev/null