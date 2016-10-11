#!/bin/sh
################################################################################
## File    : java.sh                                                          ##
## Author  : N2OMatt - n2o.matt@gmail.com                                     ##
## Date    : Tue Oct 11 21:03:55 2016 UTC                                     ##
## License : GPLv3                                                            ##
##                                                                            ##
## Install the Oracle JDK                                                     ##
## We're using the ppa provide by Webupd8.                                    ##
## www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html       ##
################################################################################

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update

## Automatically accept the license.
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

## Install.
sudo apt-get install oracle-java8-installer
