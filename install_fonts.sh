#!/bin/bash

mkdir -p ~/.fonts
cp ./fonts/* ~/.fonts

fc-cache -f -v
