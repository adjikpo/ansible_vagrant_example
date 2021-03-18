#!/bin/sh

set -e
set -u

#install packages python3-pip vim git tree curl ansible
echo "INSTALLATION...START"
apt-get update
sudo apt -qq install -y python3-pip vim git tree curl 
echo "install python3-pip, vim, git, tree, curl : OK "
pip3 install ansible
echo "install ansible : OK"
apt-get -qq update
echo "INSTALLATION...DONE"

#ansible files
echo "ANSIBLE...STRUCTURE....START"
mkdir -p /home/vagrant/project-ansible
touch /home/vagrant/project-ansible/hosts
touch /home/vagrant/project-ansible/playbook.yml
mkdir -p /home/vagrant/project-ansible/roles
cd /home/vagrant/project-ansible/roles
ansible-galaxy init roleProject
echo "ANSIBLE...STRUCTURE....DONE"
tree

#add the clients ip 
#cd /home/vagrant/project-ansible

