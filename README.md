# CHT bng Project

## Software requirement
1. OS: Ubuntu 16.04

## Installation Guide

### 1. Install VirtualBox 5.2
  Step 1. sudo apt-get remove --auto-remove virtualbox
  Step 2. sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian xenial contrib" >> /etc/apt/sources.list.d/virtualbox.list'
  Step 3. wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
  Step 4. wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
  Step 5. sudo apt update
  Step 6. sudo apt install virtualbox-5.2
  Step 7. sudo reboot

### 2. Install Vagrant 2.0.3
  Step 1. wget https://releases.hashicorp.com/vagrant/2.0.3/vagrant_2.0.3_x86_64.deb
  Step 2. sudo dpkg -i vagrant_2.0.3_x86_64.deb
