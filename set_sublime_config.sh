#!/bin/bash
HOST=$(uname -s);

OSX_PATH="$HOME/Library/Application Support/Sublime Text 3/Packages/User/"
LINUX_PATH="$HOME/.config/sublime-text-3/Packages/User/";

if [ "$HOST" == "Darwin" ]; then
    cp -Rv ./sublime_config/* "$OSX_PATH";
else
    cp -Rv ./sublime_config/* "$LINUX_PATH";
fi;
