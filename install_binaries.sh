#!/bin/bash

## COWNOTE(n2omatt): I'm setting it just for GNU/Linux for now, 
##   the binaries scripts are set just to download the GNU/Linux
##   version of the programs. Maybe we can get it running on 
##   other OSes as well.  
CURR_OS=$(uname -o | tr "[:upper:]" "[:lower:]" | tr  "/" "_");
if [ "$CURR_OS" != "gnu_linux" ]; then
    echo "[$0] OS ($CURR_OS) isn't gnu_linux - Aborting...";
    exit 0;
fi;

for INSTALL_FILE in $(ls ./binaries_info); do
    sudo ./binaries_info/$INSTALL_FILE;
done;
