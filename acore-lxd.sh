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
print_style "---------------------------------------------------------------------------\n" "warning"
sleep 2
print_style "Please tell me what DB would you like to use MariaDB 10.x or Oracle MySQL 8.0\n" "info"
print_style "If you do not chose and hit ENTER, it will be installed by default Oracle MySQL\n" "info"
print_style "Please provide anserw: mariadb or mysql\n" "danger"
read mver

MVER=${mver}

if [ "$MVER" = "mariadb" ] ; then

	print_style "You chose MariaDB, installation will start now\n"

lxc launch ubuntu:focal acoremariadb
sleep 5

lxc exec acoremariadb -- bash -c "
apt update && apt full-upgrade -y
apt install -y git cmake make gcc g++ clang libssl-dev libbz2-dev libreadline-dev libncurses-dev libace-6.* libace-dev mariadb-server mariadb-client libmariadb-dev libmariadbclient-dev libmariadb-dev-compat gdb screen unzip
mysql <<MYSQL_SCRIPT
DROP USER IF EXISTS 'acore'@'localhost';
DROP USER IF EXISTS 'acore'@'127.0.0.1';
CREATE USER 'acore'@'localhost' IDENTIFIED BY 'acore';
CREATE USER 'acore'@'127.0.0.1' IDENTIFIED BY 'acore';
GRANT ALL PRIVILEGES ON * . * TO 'acore'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON * . * TO 'acore'@'127.0.0.1' WITH GRANT OPTION;
FLUSH PRIVILEGES;
MYSQL_SCRIPT
cd /usr/src/
git clone https://github.com/azerothcore/azerothcore-wotlk.git --branch master --single-branch azerothcore
cd /usr/src/azerothcore/
mkdir build && cd build
cmake ../ -DCMAKE_INSTALL_PREFIX=/opt/azeroth-server/ -DCMAKE_C_COMPILER=/usr/bin/clang -DCMAKE_CXX_COMPILER=/usr/bin/clang++ -DWITH_WARNINGS=1 -DTOOLS=0 -DSCRIPTS=1
make -j 8 && make install
cd ..
bash apps/db_assembler/db_assembler.sh 5
cd /opt/azeroth-server/
mkdir data && cd data
wget https://github.com/wowgaming/client-data/releases/download/v10/data.zip
unzip data.zip
rm -fr data.zip
cd /opt/azeroth-server/etc/
cp -av authserver.conf.dist authserver.conf
cp -av worldserver.conf.dist worldserver.conf
sed -i 's;DataDir = ".";DataDir = "../data/";g' worldserver.conf
cd /root/
wget https://raw.githubusercontent.com/nolt/acore-linux-restarter/master/acoreadmin.sh
chmod +x acoreadmin.sh"

else
	print_style "You chose Oracle MySQL, installation will start now\n"

lxc launch ubuntu:focal acoremysql
sleep 5

lxc exec acoremysql -- bash -c "
apt update && apt full-upgrade -y
apt install -y git cmake make gcc g++ clang libmysqlclient-dev libssl-dev libbz2-dev libreadline-dev libncurses-dev mysql-server libace-6.* libace-dev gdb screen unzip
mysql <<MYSQL_SCRIPT
DROP USER IF EXISTS 'acore'@'localhost';
DROP USER IF EXISTS 'acore'@'127.0.0.1';
CREATE USER 'acore'@'localhost' IDENTIFIED BY 'acore';
CREATE USER 'acore'@'127.0.0.1' IDENTIFIED BY 'acore';
GRANT ALL PRIVILEGES ON * . * TO 'acore'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON * . * TO 'acore'@'127.0.0.1' WITH GRANT OPTION;
FLUSH PRIVILEGES;
MYSQL_SCRIPT
cd /usr/src/
git clone https://github.com/azerothcore/azerothcore-wotlk.git --branch master --single-branch azerothcore
cd /usr/src/azerothcore/
mkdir build && cd build
cmake ../ -DCMAKE_INSTALL_PREFIX=/opt/azeroth-server/ -DCMAKE_C_COMPILER=/usr/bin/clang -DCMAKE_CXX_COMPILER=/usr/bin/clang++ -DWITH_WARNINGS=1 -DTOOLS=0 -DSCRIPTS=1
make -j 8 && make install
cd ..
bash apps/db_assembler/db_assembler.sh 5
cd /opt/azeroth-server/
mkdir data && cd data
wget https://github.com/wowgaming/client-data/releases/download/v10/data.zip
unzip data.zip
rm -fr data.zip
cd /opt/azeroth-server/etc/
cp -av authserver.conf.dist authserver.conf
cp -av worldserver.conf.dist worldserver.conf
sed -i 's;DataDir = ".";DataDir = "../data/";g' worldserver.conf
cd /root/
wget https://raw.githubusercontent.com/nolt/acore-linux-restarter/master/acoreadmin.sh
chmod +x acoreadmin.sh"
fi

print_style "Congratulations! - Your AzerothCore server on LXD container has been successfuly installed.\n" "success"
print_style "Your container is up & running!\n" "success"
print_style "INFO: Remember to change your default password for MySQL user and in AzerothCore configuration files.\n" "info"
print_style "It is highly recommended to secure your MySQL server!\n" "info"
print_style "For more information go to: https://www.azerothcore.org/wiki/home\n" "info"
print_style "---------------------------------------------------------------------------\n" "warning"
print_style "SUPPORT AZEROTHCORE PROJECT!\n" "danger"
print_style "---------------------------------------------------------------------------\n" "warning"
