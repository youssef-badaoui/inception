#!/bin/bash

chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root
cp wp-config-sample.php wp-config.php
# rm wp-config-sample.php
sed -i "s/database_name_here/$DB_NAME/" wp-config.php
sed -i "s/username_here/$DB_USER/" wp-config.php
sed -i "s/password_here/$DB_USER_PASS/" wp-config.php
sed -i "s/localhost/mariadb/" wp-config.php
sed -i "s/\/run\/php\/php7.3-fpm.sock/9000/" /etc/php/7.3/fpm/pool.d/www.conf
sleep 10
wp core install --url=$MY_DOMAIN_NAME --title=MY_blog --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_EMAIL --allow-root
wp user create $WP_USER $WP_USER_EMAIL --role=$WP_USER_RULE --user_pass=$WP_USER_PASS --allow-root
# cat wp-config.php
php-fpm7.3 -F
# bash