#!/bin/bash

sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

mysql -u root -prooty -e "CREATE DATABASE IF NOT EXISTS newdb;"
mysql -u root -prooty -e "CREATE USER IF NOT EXISTS 'newuser' IDENTIFIED BY 'usery';"
mysql -u root -prooty -e "GRANT ALL PRIVILEGES ON newdb.* TO 'newuser';"
mysql -u root -prooty -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'rooty';"
mysql -u root -prooty -e "FLUSH PRIVILEGES;"
kill `cat /var/run/mysqld/mysqld.pid`
mysqld
# bash