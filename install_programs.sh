#!/bin/bash

#Add the ppas and install everything inside the install_base.
./install_programs/main.py --purge=./install_programs/list_programs/purge.txt
./install_programs/main.py --ppa=./install_programs/list_programs/ppa.txt
./install_programs/main.py --install=./install_programs/list_programs/install.txt

./install_programs/post_run.sh
