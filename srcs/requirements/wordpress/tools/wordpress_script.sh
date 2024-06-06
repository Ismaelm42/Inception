#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ]; then
	wp core download --allow-root
	sleep 15
	wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME --allow-root
	wp core install --url=$DOMAIN --title="$WORDPRESS_TITLE" --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email="$WORDPRESS_ADMIN_EMAIL" --allow-root
	wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --role=author --user_pass=$WORDPRESS_USER_PASSWORD --allow-root
fi

/usr/sbin/php-fpm7.4 -F
