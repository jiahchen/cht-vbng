#!/bin/bash

apt-get update
apt-get install vlc ppp -y

# install PPPoE Server
wget https://dianne.skoll.ca/projects/rp-pppoe/download/rp-pppoe-3.13.tar.gz
tar zxvf rp-pppoe-3.13.tar.gz
cd rp-pppoe-3.13/src
./configure
make
make install

# setup vlan interface
ip link add link eth1 name eth1.895 type vlan id 895
ip link add link eth1 name eth1.4001 type vlan id 4001
ifconfig eth1.895 up
ifconfig eth1.4001 up

# config PPPoE server
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -A POSTROUTING -t nat -s 10.10.10.0/24 -o eth0 -j MASQUERADE
