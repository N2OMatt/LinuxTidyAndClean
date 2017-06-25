#!/bin/bash
git submodule update --init --recursive
## Install the programs that system need to run everything else.
./install_programs.sh
./install_pips.sh
./install_binaries.sh

## Setup the home folder.
./clean_home_folder.sh
./create_bashprofile.sh

## Download/Install AmazingCow stuff.
./download_all_repos.sh
./install_amazingcow_programs.sh

## Download/Install N2OMatt stuff.
./install_dots.sh
./install_bash_status_line.sh

## Configure everything else.
./set_git_config.sh
./set_sublime_config.sh
./set_monodevelop_config.sh
./set_qtcreator_config.sh
./set_various_programs_config.sh
