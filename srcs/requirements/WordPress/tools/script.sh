#!/bin/bash
# chmod 600 wp-config.php

sed -i "s/database_name_here/newdb/" wp-config.php
sed -i "s/username_here/newuser/" wp-config.php
sed -i "s/password_here/usery/" wp-config.php
sed -i "s/localhost/mariadb/" wp-config.php

wp core install --url=http://localhost:80/ --title=tobedefianed --admin_user=wp-admin --admin_password=your_admin_password --admin_email=your_admin_email --allow-root
php-fpm7.4 -F
# bash
