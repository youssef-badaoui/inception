#!/bin/bash
service mysql start

sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

mysql -e "CREATE DATABASE newdb;"
mysql -e "CREATE USER 'newuser' IDENTIFIED BY 'usery';"
mysql -e "GRANT ALL PRIVILEGES ON newdb.* TO 'newuser';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'rooty';"

# mysqld

bash