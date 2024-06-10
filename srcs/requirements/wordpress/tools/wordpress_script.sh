#!/bin/bash

# Check if the WordPress configuration file does not exist
if [ ! -f /var/www/html/wp-config.php ]; then
	# Download the core WordPress files
	wp core download --allow-root
	# Allow some time for the download to complete
	sleep 15
	# Create the WordPress configuration file with the provided database credentials
	wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME --allow-root
	# Install WordPress with the specified site URL, title, and admin credentials
	wp core install --url=$DOMAIN --title="$WORDPRESS_TITLE" --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email="$WORDPRESS_ADMIN_EMAIL" --allow-root
	# Create a new WordPress user with the specified role and credentials
	wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --role=author --user_pass=$WORDPRESS_USER_PASSWORD --allow-root
fi

# Start the PHP FastCGI Process Manager in the foreground
/usr/sbin/php-fpm7.4 -F
