# ![logo](https://raw.githubusercontent.com/azerothcore/azerothcore.github.io/master/images/logo-github.png) AzerothCore

# AzerothCore LXD

## Introduction
Install AzerothCore server using LXD container.
- **master** branch - script based installation
- **full-images** branch - complete LXD images

### Wiki
Manual setup and installation LXD and AzerothCore  
[DIY installation](https://github.com/nolt/acore-lxd-image/wiki)

## Requirements
Installed and configured LXD on your Linux. (install and initialize setps are required)  
https://documentation.ubuntu.com/lxd/en/latest/getting_started/

## Components that will be installed
OS: Ubuntu 24.04  
AzerothCore: latest from GitHub  
MySQL: 8.4 LTS  
[Client data](https://github.com/wowgaming/client-data/releases/download/v18.0/Data.zip)  
ACore restarter: https://github.com/nolt/acore-linux-restarter

## Installation
- download script
- chmod +x acore-lxd.sh
- ./acore-lxd.sh

## Post install
- remember to change default password for "*acore*" MySQL user
- secure your MySQL server with "*mysql_secure_installation*" command
- more details about installation [AzerothCore Wiki](https://www.azerothcore.org/wiki/Installation)

## Optional
- macvlan profile (if you want to play on LAN → https://blog.simos.info/how-to-make-your-lxd-container-get-ip-addresses-from-your-lan/)


Support : [AzerothCore](http://azerothcore.org)
