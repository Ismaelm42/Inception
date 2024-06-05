#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ]; then
	curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x /usr/local/bin/wp
	wp core download --allow-root
	mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php 
	sed -i "s/define('DB_NAME', 'database_name_here');/define('DB_NAME', '$MYSQL_DATABASE');/" /var/www/html/wp-config.php
	sed -i "s/define('DB_USER', 'username_here');/define('DB_USER', '$MYSQL_USER');/" /var/www/html/wp-config.php
	sed -i "s/define('DB_PASSWORD', 'password_here');/define('DB_PASSWORD', '$MYSQL_PASSWORD');/" /var/www/html/wp-config.php
	wp core install --url=$DOMAIN --title="$WORDPRESS_TITLE" --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD  --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email --allow-root
	wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --role=author --user_pass=$WORDPRESS_USER_PASSWORD --allow-root
fi

/usr/sbin/php-fpm7.4 -F
