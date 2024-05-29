#!/bin/bash

# creación de la carpeta para evitar error
mkdir -p /run/mysqld/

#inicio mysql
mysql -e

# inicia mysql en segundo plano
service mysql start;

# crea la base de datos si no existe
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# crea un usuario si no existe con su respectivo password
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# atribuye todos los privilegios de la nueva base de datos al usuario creado
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# modifica el usuario root y establece el password
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# se reinician los privilegios de forma a que los cambios se hagan efectivos
mysql -e "FLUSH PRIVILEGES;"# mysql -e "FLUSH PRIVILEGES;"

# se apaga mysql
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# inicia mysql en primer plano
exec mysqld_safe

