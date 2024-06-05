#!/bin/bash

# inicia mysql en segundo plano. Se puede poner condicional de modo que examine si existe el volumen de la base de datos para realizarlo. Gemartin Inception.
service mariadb start; # service mysql start;

sleep 10

# crea la base de datos si no existe
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

# crea un usuario si no existe con su respectivo password
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# atribuye todos los privilegios de la nueva base de datos al usuario creado
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# modifica el usuario root y establece el password
mysql -e "ALTER USER '${MYSQL_ROOT_USER}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

# se reinician los privilegios de forma a que los cambios se hagan efectivos
mysql -u ${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

# se apaga mysql
mysqladmin -u ${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} shutdown

# se vuelve a iniciar mariadb
mysqld_safe
