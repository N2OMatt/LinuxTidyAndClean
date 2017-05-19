#!/bin/bash

for INSTALL_FILE in $(ls ./binaries_info); do
    sudo ./binaries_info/$INSTALL_FILE;
done;
