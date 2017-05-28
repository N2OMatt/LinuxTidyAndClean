#!/bin/bash

echo "--> Creating bash_profile...";

echo "if [ -e ~/.bashrc ]; then " >  ~/.bash_profile;
echo "   source ~/.bashrc"        >> ~/.bash_profile;
echo "fi"                         >> ~/.bash_profile;

echo "--> Done...";
