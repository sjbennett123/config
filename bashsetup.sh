#!/bin/bash


# https://askubuntu.com/questions/334318/sudoers-file-enable-nopasswd-for-user-all-commands
# %sudo  ALL=(ALL) NOPASSWD: ALL

touch "$HOME/.hushlogin"

sudo apt-get install python3 -y

sudo apt-get install python3-pip -y

suodo apt-get install unzip -y

sudo apt-get install ansible -y 

git config --global credential.helper "cache --timeout=60480000"
git config --global core.longpaths true
git config --global --type bool push.autoSetupRemote true
git config --global windows.appendAtomically false
git config --global diff.external difft
git config --global user.email "deadkid@gmail.com"
git config --global user.name "Scott Bennett"



ansible-playbook ubuntu_wsl.yml 
