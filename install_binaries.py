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

def download_and_install(program_name, info):
    package_name = info["package_name"];
    download_url = info["download_url"];
    install_file = info["install_file"];

    download_fullpath     = os.path.join(BIN_PATH, program_name);
    install_file_fullpath = os.path.join(INFO_PATH, install_file);

    print download_fullpath;
    print install_file_fullpath;

    #Check if the item is already downloaded.
    if(os.path.exists(download_fullpath)):
        print "Already downloaded...."
    else:
        os.system("mkdir -p {}".format(download_fullpath));
        download_binary(download_url, download_fullpath);

    #Call the installation script.
    os.system("{script} {downpath} {pkgname}".format(script=install_file_fullpath,
                                                     downpath=download_fullpath,
                                                     pkgname=package_name));

def run(programs):
    print "Running for:\n", "\n".join(programs);

    for program_name in programs:
        info_path = os.path.join(INFO_PATH, program_name + ".json");
        info_json = json.load(open(info_path));

        for program_info in info_json:
            download_and_install(program_name, program_info);

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
