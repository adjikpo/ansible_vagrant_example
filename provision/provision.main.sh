#!/bin/sh

set -e
set -u

color='\e[1;36m'

#install packages python3-pip vim git tree curl ansible
echo "${color} INSTALLATION...START"
apt-get -qq update
sudo apt -qq install -y python3-pip vim git tree curl 
echo "${color} install python3-pip, vim, git, tree, curl : OK "
pip3 install ansible
echo "${color} install ansible : OK"
apt-get -qq update
echo "${color} INSTALLATION...DONE"

#ansible files
echo "${color} ANSIBLE...STRUCTURE....START"
mkdir -p /home/vagrant/project-ansible
touch /home/vagrant/project-ansible/hosts
touch /home/vagrant/project-ansible/playbook.yml
mkdir -p /home/vagrant/project-ansible/roles
cd /home/vagrant/project-ansible/roles
ansible-galaxy init roleProject
echo "${color} ANSIBLE...STRUCTURE....DONE"
tree

#add the clients ip 
#cd /home/vagrant/project-ansible

