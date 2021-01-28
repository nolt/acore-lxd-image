# ACore-lxd-image
ACore LXD image based on Ubuntu 20.04. Setup and GO!

Download LXD Image: https://mega.nz/file/gNhgQZBa#-i45LDz7Xww9aDTeo863KNyRwamJYS8lhJNUDKIUdcM  
acore-img-ubuntu.tar.gz sha1sum: 289561a652d5ebeaa7e4c784231f8386abef491b  

Support : [AzerothCore](http://azerothcore.org)

## Components
OS: Ubuntu 20.04  
MySQL: 8.0  
ACore: latest from Git  
Client data: (https://github.com/wowgaming/client-data/releases/tag/v9)  
ACore restarter: https://github.com/nolt/acore-linux-restarter

## Requirements
- lxd package
- macvlan profile (if you want to play on LAN → https://blog.simos.info/how-to-make-your-lxd-container-get-ip-addresses-from-your-lan/)

## Installation
- snap install lxd
- lxd init (configure as described here https://linuxcontainers.org/lxd/getting-started-cli/#initial-configuration)
- lxc image import acore-img-ubuntu.tar.gz --alias acore-img-ubuntu
- lxc launch acore-img-ubuntu acore-server

## Connect and manage
- lxc exec acore-server bash
- read file README in /root/
