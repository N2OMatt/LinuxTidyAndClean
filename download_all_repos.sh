#!/bin/bash


cd ./DownloadRepos;
git pull origin master;

./download_amazingcow.py 
./download_n2omatt.py
