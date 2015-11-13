#!/bin/sh

#COWTODO: Make this install the binary automatically....
echo "Installing QT - [$1]..."

#Make executable
chmod 744 $1

#Run...
$1

