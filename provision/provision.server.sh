#!/bin/sh

set -e
set -u

#install packages
apt-get update
sudo apt install -y python3-pip vim git 
pip3 install ansible
apt-get update