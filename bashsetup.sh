#!/bin/bash
sudo apt-get update;

mkdir ~/.bashrc.d
sudo apt-get install python3 -y

sudo apt-get install python3-pip -y

sudo apt-get install ansible -y

ansible-galaxy collection install community.general

ansible-playbook ubuntu_wsl.yml 
