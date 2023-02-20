#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
mkdir -p /run/php/
mkdir -p /var/www/html
cd /var/www/html
wp core download --allow-root
cp wp-config-sample.php wp-config.php
rm wp-config-sample.php
chmod 600 wp-config.php

sed -i "s/database_name_here/newdb/" wp-config.php
sed -i "s/username_here/newuser/" wp-config.php
sed -i "s/password_here/usery/" wp-config.php
sed -i "s/localhost/mariadb/" wp-config.php

wp core install --url=http://localhost/ --title=tobedefianed --admin_user=wp-admin --admin_password=your_admin_password --admin_email=email@email.com --allow-root
php-fpm7.3 -F
# bash
