#!/usr/bin/python

## Imports ##
import os;
import os.path;
import sys;
import json;
import wget;

## Constants ##
INFO_PATH      = "./binaries_info";
BIN_PATH       = "./binaries"
INFO_FILENAMES = map(lambda x: x.replace("\n", "").replace(".json", ""),
                     os.listdir(INFO_PATH));

def print_help():
    print "help";
    exit(1);

def print_fatal(msg):
    m = "{} - {}".format("[FATAL]", msg);
    print m;
    exit(1);

def download_binary(url, destination):
    wget.download(url, destination);

def download_and_install(info):
    name         = info["name"];
    url          = info["url"];
    dir          = info["dir"];
    install_file = info["install_file"];

    full_bindir_path      = os.path.join(BIN_PATH, dir);
    bin_name              = os.path.split(url)[1];
    bin_fullpath          = os.path.join(full_bindir_path, bin_name);
    install_file_fullpath = os.path.join(INFO_PATH, install_file);

    #Check if the item is already downloaded.
    if(os.path.exists(bin_fullpath)):
        print "Already downloaded...."
    else:
        os.system("mkdir -p {}".format(full_bindir_path));
        download_binary(url, bin_fullpath);

    #Call the installation script.
    os.system("{} {}".format(install_file_fullpath, bin_fullpath));

def run(programs):
    print "Running for:\n", "\n".join(programs);

    for program in programs:
        info_path = os.path.join(INFO_PATH, program + ".json");
        info_json = json.load(open(info_path));

        for program_info in info_json:
            download_and_install(program_info);

def main():
    if(len(sys.argv) == 1):
        print_help();

    install_option = sys.argv[1];

    if(install_option == "all"):
        run(INFO_FILENAMES);
    elif(install_option in INFO_FILENAMES):
        run([install_option]);
    else:
        print_fatal("{} is not is not recognized.".format(install_option));


if(__name__ == "__main__"):
    main();
