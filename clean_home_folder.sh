#!/bin/bash
cd $HOME;

echo "--> Clean Home Folder...";

## Clean useless directories.
rm -rfv Public
rm -rfv Templates

## Create the directory for torrents
mkdir -pv ./Downloads/_torrent_complete
mkdir -pv ./Downloads/_torrent_download



echo "--> Done...";
