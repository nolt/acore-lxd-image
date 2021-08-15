# ACore-lxd-images
ACore LXD image based on Ubuntu 20.04. Setup and GO!

#### [Video tutorial](https://asciinema.org/a/404479)

## LXD Image downloads  
ACore with MariaDB: https://mega.nz/file/oIg0CLLD#hDJf40IJ_fpiq9P-xXVIFsKzVT0OFNnNyk8ycJVF-1Y  
acore-img-mariadb-ubuntu.tar.gz SHA1: 9b5025cecae8970d2825a8f04891705917a08a0e

Acore with MySQL: https://mega.nz/file/oEwVTCRI#JXp3Y3VMf-tu-aVd8REdnXfrYMRImp87b52MkMfd84Y
acore-img-mysql-ubuntu.tar.gz SHA1: 5dc582f54836633c1d9d6ae213a55fc97dfadd78

Support : [AzerothCore](http://azerothcore.org)

## Components
OS: Ubuntu 20.04  
MariaDB: 10.3 or MySQL: 8.0  
ACore: latest from Git  
Client data: (https://github.com/wowgaming/client-data/releases/tag/v11)  
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
