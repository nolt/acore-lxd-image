# ACore-lxd-images
ACore LXD image based on Ubuntu 20.04. Setup and GO!

#### [Video tutorial](https://asciinema.org/a/404479)

## LXD Image downloads  
ACore with MariaDB: https://mega.nz/file/8Fx0Uaxa#tzzZspTurk_vbS01iTGL8Hvv4fKIvZSHzcsxWuEMqG8  
acore-img-mariadb-ubuntu.tar.gz SHA1: a933819e45f8fa13f8a9be7ef643b632127caf84

Acore with MySQL: https://mega.nz/file/UMRxkC4L#acbbmLl-wnLo5fWYjYuKbnWWAE8aFLVYSoYo_50lN0o
acore-img-mysql-ubuntu.tar.gz SHA1: 06a6a4867454fe0bb74a67161cff20959fe67449

Support : [AzerothCore](http://azerothcore.org)

## Components
OS: Ubuntu 20.04  
MariaDB: 10.3 or MySQL: 8.0  
ACore: latest from Git  
Client data: (https://github.com/wowgaming/client-data/releases/tag/v10)  
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
