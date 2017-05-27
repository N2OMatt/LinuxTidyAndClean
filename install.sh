#!/bin/bash
git submodule update --init --recursive

./set_git_config.sh
./download_all_repos.sh
./install_dots.sh
./install_bash_status_line.sh
./install_programs.sh
./install_binaries.sh
./install_pip.sh
./set_sublime_config.sh

