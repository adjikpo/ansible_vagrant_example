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

#add the clients ip 192.168.50.11 & 192.168.50.12
echo "${color} ADD THE IP TO HOSTS ANSIBLE...START"
cd /home/vagrant/project-ansible
sudo su
echo "[front]
192.168.50.11
[back]
192.168.50.12" > hosts
echo "${color} ADD THE IP TO HOSTS ANSIBLE...DONE"

#add the provisioning
echo "${color} ADD THE PROVISIONING TO PLAYBOOK ANSIBLE...START"
cd /home/vagrant/project-ansible
sudo su
echo " #front
- hosts: front
  remote_user: vagrant 
  roles:
    - env

#back
- hosts: back 
  remote_user: vagrant
  roles:
    - env
" > playbook.yml
echo "${color} ADD THE PROVISIONING TO PLAYBOOK ANSIBLE...DONE"

#client packages installation test
# cd /home/vagrant/project-ansible
# sudo su
# echo "- name: Install 
#   apt:
#     name={{ item }}
#     state=latest
#     update_case=yes
#   with_items:
#     - vim
#     - git 
#     - curl
#     - tree
# " > ???
