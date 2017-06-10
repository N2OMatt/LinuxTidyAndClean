#!/bin/bash
git submodule update --init --recursive

./clean_home_folder.sh
./create_bashprofile.sh

./download_all_repos.sh
./install_amazingcow_programs.sh

./install_dots.sh
./install_bash_status_line.sh

./install_programs.sh
./install_binaries.sh
./install_pip.sh

./set_git_config.sh
./set_sublime_config.sh
./set_monodevelop_config.sh
./set_qtcreator_config.sh
