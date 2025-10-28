#!/bin/bash

#############################
# Created by Nolt           #
# https://github.com/nolt   #
#############################

#------------------------------------------------------------------
# prints colored text
print_style () {

    if [ "$2" == "info" ] ; then
        COLOR="96m";
    elif [ "$2" == "success" ] ; then
        COLOR="92m";
    elif [ "$2" == "warning" ] ; then
        COLOR="93m";
    elif [ "$2" == "danger" ] ; then
        COLOR="91m";
    else #default color
        COLOR="0m";
    fi

    STARTCOLOR="\e[$COLOR";
    ENDCOLOR="\e[0m";

    printf "$STARTCOLOR%b$ENDCOLOR" "$1";
}

#------------------------------------------------------------------

print_style "---------------------------------------------------------------------------\n" "warning"
print_style "Welcome - this tool will install and confiugre AzerorthCore server on LXD!\n" "success"
print_style "Installation process depends on your hardware specs and connection speed!\n" "success"
print_style "\n"
print_style "Directories used in this build are:\n" "info"
print_style " - sources: /usr/src/azerothcore/\n" "info"
print_style " - installation: /opt/azeroth-server/\n" "info"
print_style "---------------------------------------------------------------------------\n" "warning"
sleep 3
#print_style "Please tell me what DB would you like to use MariaDB 10.x or Oracle MySQL 8.0\n" "info"
#print_style "If you do not chose and hit ENTER, it will be installed by default Oracle MySQL\n" "info"
#print_style "Please provide anserw: mariadb or mysql\n" "danger"
#read mver

#MVER=${mver}
#
#if [ "$MVER" = "mariadb" ] ; then
#
#	print_style "You chose MariaDB, installation will start now\n"
#
#lxc launch ubuntu:jammy acoremariadb
#sleep 5
#
#lxc exec acoremariadb -- bash -c "
#apt update && apt full-upgrade -y
#wget https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
#chmod +x mariadb_repo_setup
#./mariadb_repo_setup --mariadb-server-version="mariadb-10.6"
#rm -f mariadb_repo_setup
#apt update
#apt install -y clang cmake g++ gcc gdb git libboost-all-dev libbz2-dev libmariadb-dev libmariadb-dev-compat libncurses-dev libreadline-dev libssl-dev make mariadb-client mariadb-server screen unzip
#mysql <<MYSQL_SCRIPT
#DROP USER IF EXISTS 'acore'@'localhost';
#DROP USER IF EXISTS 'acore'@'127.0.0.1';
#CREATE USER 'acore'@'localhost' IDENTIFIED BY 'acore' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0;
#CREATE USER 'acore'@'127.0.0.1' IDENTIFIED BY 'acore' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0;
#CREATE DATABASE 'acore_world' DEFAULT CHARACTER SET UTF8MB4 COLLATE utf8mb4_general_ci;
#CREATE DATABASE 'acore_characters' DEFAULT CHARACTER SET UTF8MB4 COLLATE utf8mb4_general_ci;
#CREATE DATABASE 'acore_auth' DEFAULT CHARACTER SET UTF8MB4 COLLATE utf8mb4_general_ci;
#GRANT ALL PRIVILEGES ON 'acore_world' . * TO 'acore'@'localhost' WITH GRANT OPTION;
#GRANT ALL PRIVILEGES ON 'acore_characters' . * TO 'acore'@'localhost' WITH GRANT OPTION;
#GRANT ALL PRIVILEGES ON 'acore_auth' . * TO 'acore'@'localhost' WITH GRANT OPTION;
#GRANT ALL PRIVILEGES ON 'acore_world' . * TO 'acore'@'127.0.0.1' WITH GRANT OPTION;
#GRANT ALL PRIVILEGES ON 'acore_characters' . * TO 'acore'@'127.0.0.1' WITH GRANT OPTION;
#GRANT ALL PRIVILEGES ON 'acore_auth' . * TO 'acore'@'127.0.0.1' WITH GRANT OPTION;
#FLUSH PRIVILEGES;
#MYSQL_SCRIPT
#cd /usr/src/
#git clone https://github.com/azerothcore/azerothcore-wotlk.git --branch master --single-branch azerothcore
#cd /usr/src/azerothcore/
#mkdir build && cd build
#cmake ../ -DCMAKE_INSTALL_PREFIX=/opt/azeroth-server/ -DCMAKE_C_COMPILER=/usr/bin/clang -DCMAKE_CXX_COMPILER=/usr/bin/clang++ -DWITH_WARNINGS=1 -DTOOLS_BUILD=all -DSCRIPTS=static -DMODULES=static
#make -j `nproc` && make install
#cd /opt/azeroth-server/
#mkdir data && cd data
#wget https://github.com/wowgaming/client-data/releases/download/v16/data.zip
#unzip data.zip
#rm -fr data.zip
#cd /opt/azeroth-server/etc/
#cp -av authserver.conf.dist authserver.conf
#cp -av worldserver.conf.dist worldserver.conf
#sed -i 's;DataDir = ".";DataDir = "../data/";g' worldserver.conf
#cd /root/
#wget https://raw.githubusercontent.com/nolt/acore-linux-restarter/master/acoreadmin.sh
#chmod +x acoreadmin.sh"
#
#else
#	print_style "You chose Oracle MySQL, installation will start now\n"

lxc launch ubuntu:noble acoremysql
sleep 5

lxc exec acoremysql -- bash -c "
export DEBIAN_FRONTEND=noninteractive
wget https://dev.mysql.com/get/mysql-apt-config_0.8.36-1_all.deb -P /tmp/
apt -y install /tmp/mysql-apt-config_0.8.36-1_all.deb
apt update && apt -y full-upgrade
apt -y install clang cmake g++ gcc gdb git libboost-all-dev libbz2-dev libmysqlclient-dev libncurses-dev libreadline-dev libssl-dev make mysql-server screen unzip && apt clean
mysql <<MYSQL_SCRIPT
DROP USER IF EXISTS 'acore'@'localhost';
DROP USER IF EXISTS 'acore'@'127.0.0.1';
CREATE USER 'acore'@'localhost' IDENTIFIED BY 'acore' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0;
CREATE USER 'acore'@'127.0.0.1' IDENTIFIED BY 'acore' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0;
CREATE DATABASE 'acore_world' DEFAULT CHARACTER SET UTF8MB4 COLLATE utf8mb4_general_ci;
CREATE DATABASE 'acore_characters' DEFAULT CHARACTER SET UTF8MB4 COLLATE utf8mb4_general_ci;
CREATE DATABASE 'acore_auth' DEFAULT CHARACTER SET UTF8MB4 COLLATE utf8mb4_general_ci;
GRANT ALL PRIVILEGES ON 'acore_world' . * TO 'acore'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON 'acore_characters' . * TO 'acore'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON 'acore_auth' . * TO 'acore'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON 'acore_world' . * TO 'acore'@'127.0.0.1' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON 'acore_characters' . * TO 'acore'@'127.0.0.1' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON 'acore_auth' . * TO 'acore'@'127.0.0.1' WITH GRANT OPTION;
FLUSH PRIVILEGES;
MYSQL_SCRIPT
cd /usr/src/
git clone https://github.com/azerothcore/azerothcore-wotlk.git --branch master --single-branch azerothcore
cd /usr/src/azerothcore/
mkdir build && cd build
cmake ../ -DCMAKE_INSTALL_PREFIX=/opt/azeroth-server/ -DCMAKE_C_COMPILER=/usr/bin/clang -DCMAKE_CXX_COMPILER=/usr/bin/clang++ -DWITH_WARNINGS=1 -DTOOLS_BUILD=all -DSCRIPTS=static -DMODULES=static
make -j `nproc` && make install
cd /opt/azeroth-server/
mkdir data && cd data
wget https://github.com/wowgaming/client-data/releases/download/v17/Data.zip
unzip Data.zip
rm -fr Data.zip
cd /opt/azeroth-server/etc/
cp -av authserver.conf.dist authserver.conf
cp -av worldserver.conf.dist worldserver.conf
sed -i 's;DataDir = ".";DataDir = "../data/";g' worldserver.conf
cd /root/
wget https://raw.githubusercontent.com/nolt/acore-linux-restarter/master/acoreadmin.sh
chmod +x acoreadmin.sh"
#fi

print_style "\n"
print_style "Congratulations! - Your AzerothCore server on LXD container has been successfuly installed.\n" "success"
print_style "Your container is up & running!\n" "success"
print_style "\n"
print_style "INFO: Remember to change your default password for MySQL user and in AzerothCore configuration files.\n" "info"
print_style "It is highly recommended to secure your MySQL server!\n" "info"
print_style "For more information go to: https://www.azerothcore.org/wiki/home\n" "info"
print_style "---------------------------------------------------------------------------\n" "warning"
print_style "SUPPORT AZEROTHCORE PROJECT!\n" "danger"
print_style "---------------------------------------------------------------------------\n" "warning"
