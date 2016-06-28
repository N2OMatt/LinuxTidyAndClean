#!/usr/bin/python

## Imports ##
import os;
import getopt;
import sys;


################################################################################
# PPA                                                                          #
################################################################################
def install_ppa(ppa_lines):
    ppa_to_add = [];

    for line in ppa_lines:
        grep_cmd =  "grep ^ /etc/apt/sources.list ";
        grep_cmd += "/etc/apt/sources.list.d/* | grep {} > /dev/null";
        grep_cmd  = grep_cmd.format(line);

        ret_val = os.system(grep_cmd);
        if(ret_val == 0):
            print "PPA ({}) already added.".format(line);
        else:
            ppa_to_add.append(line);


    for ppa_name in ppa_to_add:
        print "Adding PPA({})".format(ppa_name);
        add_cmd = "sudo apt-add-repository ppa:{}".format(ppa_name);
        os.system(add_cmd);

    if(len(ppa_to_add) != 0):
        os.system("sudo apt-get update && sudo apt-get upgrade");


################################################################################
# Install                                                                      #
################################################################################
def install_pkgs(install_lines):
    pkg_to_add = [];

    for pkg_name in install_lines:
        check_cmd = """dpkg -l | cut -d" " -f3 | grep -e ^{}$ > /dev/null""".format(pkg_name);
        ret_val = os.system(check_cmd);

        if(ret_val == 0):
            print "Package ({}) already added".format(pkg_name);
        else:
            pkg_to_add.append(pkg_name);

    for pkg_name in pkg_to_add:
        print "Install package ({})".format(pkg_name);
        install_cmd = "sudo apt-get install -y {}".format(pkg_name);
        os.system(install_cmd);


################################################################################
# Purge                                                                        #
################################################################################
def purge_pkgs(purge_lines):
    pkg_to_purge = [];

    for pkg_name in purge_lines:
        check_cmd = """dpkg -l | cut -d" " -f3 | grep ^{} > /dev/null""".format(pkg_name);
        ret_val = os.system(check_cmd);

        if(ret_val == 0):
            pkg_to_purge.append(pkg_name);
        else:
            print "Package ({}) not installed".format(pkg_name);

    for pkg_name in pkg_to_purge:
        print "Purging package ({})".format(pkg_name);
        purge_cmd = "sudo apt-get purge -y {}".format(pkg_name);

        os.system(purge_cmd);


################################################################################
# Helper functions                                                             #
################################################################################
def get_all_lines_from_files(files_list):
    lines = [];
    for filename in files_list:
        try:
            file_lines = open(filename).readlines();
            for line in file_lines:
                line = line.replace("\n","").lstrip(" ").rstrip(" ");
                if(len(line) != 0 and line[0] != "#"):
                    lines.append(line);
        except Exception, e:
            print e;
            exit(1);

    return lines;


def show_help():
    print "Help";


################################################################################
# Script initializaton                                                         #
################################################################################
def main():
    install_filenames = [];
    purge_filenames   = [];
    ppa_filenames     = [];

    #Get the command line flags.
    options = getopt.gnu_getopt(sys.argv[1:], "", ["install=",
                                                   "purge=",
                                                   "ppa="]);

    #Check if any flag was passed.
    if(len(options[0]) == 0):
        show_help();
        exit(1);

    #Parse the options.
    for option in options[0]:
        key, value = option;
        key = key.lstrip("-");

        if(key == "install"): install_filenames.append(value);
        if(key == "purge"  ): purge_filenames.append  (value);
        if(key == "ppa"    ): ppa_filenames.append    (value);

    install_lines = get_all_lines_from_files(install_filenames);
    purge_lines   = get_all_lines_from_files(purge_filenames);
    ppa_lines     = get_all_lines_from_files(ppa_filenames);

    install_ppa(ppa_lines);
    install_pkgs(install_lines);
    purge_pkgs(purge_lines);


if __name__ == '__main__':
    main()
