#!/usr/bin/python

import os;

def install_ppa(ppa_lines):
    ppa_to_add = [];

    for line in ppa_lines:
        line = line.replace("\n","").lstrip(" ").rstrip(" ");

        grep_cmd = "grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep {} > /dev/null";
        grep_cmd = grep_cmd.format(line);

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

def install_pkgs(install_lines):
    pkg_to_add = [];

    for pkg_name in install_lines:
        if(len(pkg_name) == 0 or pkg_name[0] == "#"):
            continue;

        pkg_name = pkg_name.replace("\n","").lstrip(" ").rstrip(" ");
        
        check_cmd = """dpkg -l | cut -d" " -f3 | grep ^{} > /dev/null""".format(pkg_name);
        ret_val = os.system(check_cmd);
        
        if(ret_val == 0):
            print "Package ({}) already added".format(pkg_name);
        else:
            pkg_to_add.append(pkg_name);
    
    for pkg_name in pkg_to_add:
        print "Install package ({})".format(pkg_name);
        install_cmd = "sudo apt-get install -y {}".format(pkg_name);
        os.system(install_cmd);

def purge_pkgs(purge_lines):
    pkg_to_purge = [];
    
    for pkg_name in purge_lines:
        pkg_name = pkg_name.replace("\n"," ").lstrip(" ").rstrip(" ");
        
        if(len(pkg_name) == 0 or pkg_name[0] == "#"):
            continue;

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
               

def main():
    install_lines = [];
    purge_lines   = [];
    ppa_lines     = [];

    try:
        install_lines = open("install.txt").readlines();
        purge_lines   = open("purge.txt").readlines();
        ppa_lines     = open("ppa.txt").readlines();
    except Exception, e:
        print e;
        exit(1);
    
    install_ppa(ppa_lines);        
    install_pkgs(install_lines);
    purge_pkgs(purge_lines);
main();
