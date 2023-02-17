#!/bin/bash
service mysql start
mysql -e "DELETE FROM mysql.user WHERE User='';"
mysql -e "CREATE DATABASE newdb ;"
mysql -e "CREATE USER 'newuser'@'%' IDENTIFIED BY 'usery';" 
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'rooty';"
mysql -e "FLUSH PRIVILEGES;"
bash