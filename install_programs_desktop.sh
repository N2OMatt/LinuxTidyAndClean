#!/bin/bash

#Add the ppas and install everything inside the install_desktop.
./install_stuff/main.py --ppa=./install_stuff/list_programs/ppa.txt
./install_stuff/main.py --install=./install_stuff/list_programs/install_desktop.txt
