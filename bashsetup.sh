#!/bin/bash


# https://askubuntu.com/questions/334318/sudoers-file-enable-nopasswd-for-user-all-commands
# %sudo  ALL=(ALL) NOPASSWD: ALL

sudo apt-get install python3 -y

sudo apt-get install python3-pip -y

sudo apt-get install ansible -y

ansible-playbook ubuntu_wsl.yml 
