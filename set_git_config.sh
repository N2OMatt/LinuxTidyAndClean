#!/bin/bash

#Setup my username and email.
git config --global user.email "n2o.matt@gmail.com"
git config --global user.name  "n2omatt"

#Set up the credential helper.
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600' #1hour
