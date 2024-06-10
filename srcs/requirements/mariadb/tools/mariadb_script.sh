#!/bin/bash

# Check if the database already exists
if [ ! -f /var/lib/mysql/databases.txt ] || ! grep -qw "${MYSQL_DATABASE}" /var/lib/mysql/databases.txt; then
	# Initiate MySQL in the background
	service mariadb start; # service mysql start;
	# Allow MySQL to fully initialize before executing further commands
	sleep 10
	# Create the database if it doesn't exist
	mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
	# Create a user if it doesn't exist with the specified password
	mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
	# Grant all privileges of the new database to the created user
	mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' WITH GRANT OPTION;"
	# Modify the root user and set the password
	mysql -e "ALTER USER '${MYSQL_ROOT_USER}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
	# Reload the privileges to make the changes effective
	mysql -u ${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
	# Create file with the database name
	echo -e "${MYSQL_DATABASE}\n" >> /var/lib/mysql/databases.txt
	# Shutdown MySQL
	mysqladmin -u ${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} shutdown
fi

# Initiate MySQL in the foreground
mysqld_safe
